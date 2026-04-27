# from django.shortcuts import render, redirect, get_object_or_404
# from django.utils import timezone
# from .models import URL
# from .utils import generate_short_code

# def index(request):
#     return render(request, 'shortener/index.html')


# def shorten_url(request):
#     if request.method == 'POST':
#         original_url = request.POST.get('url')
#         custom_alias = request.POST.get('alias')

#         if custom_alias:
#             if URL.objects.filter(short_code=custom_alias).exists():
#                 return render(request, 'shortener/error.html', {
#                     'message': 'Custom alias already exists!'
#                 })
#             short_code = custom_alias
#         else:
#             short_code = generate_short_code()

#         url_obj = URL.objects.create(
#             original_url=original_url,
#             short_code=short_code
#         )

#         short_url = request.build_absolute_uri(f'/{short_code}/')

#         return render(request, 'shortener/result.html', {
#             'short_url': short_url
#         })

#     return redirect('index')


# def redirect_url(request, short_code):
#     url_obj = get_object_or_404(URL, short_code=short_code)

#     # Check expiry
#     if url_obj.expiry_date and timezone.now() > url_obj.expiry_date:
#         return render(request, 'shortener/error.html', {
#             'message': 'This link has expired!'
#         })

#     url_obj.clicks += 1
#     url_obj.save()

#     return redirect(url_obj.original_url)


from django.shortcuts import render, redirect, get_object_or_404
from django.utils import timezone
from django.core.validators import URLValidator
from django.core.exceptions import ValidationError
from django.http import JsonResponse
from .models import URL
from .utils import generate_short_code
import re


def index(request):
    return render(request, 'shortener/index.html')


def shorten_url(request):
    if request.method == 'POST':
        original_url = request.POST.get('url')
        custom_alias = request.POST.get('alias')

        # ✅ Validate URL
        validator = URLValidator()
        try:
            validator(original_url)
        except ValidationError:
            return render(request, 'shortener/error.html', {
                'message': 'Invalid URL! Please enter a valid link.'
            })

        # ✅ Clean alias
        if custom_alias:
            custom_alias = custom_alias.strip()

            # Only allow safe characters
            if not re.match(r'^[a-zA-Z0-9_-]+$', custom_alias):
                return render(request, 'shortener/error.html', {
                    'message': 'Alias can only contain letters, numbers, "-" and "_"'
                })

            # Check if already exists
            if URL.objects.filter(short_code=custom_alias).exists():
                return render(request, 'shortener/error.html', {
                    'message': 'This alias is already taken!'
                })

            short_code = custom_alias

        else:
            short_code = generate_short_code()

        # ✅ Save to DB
        url_obj = URL.objects.create(
            original_url=original_url,
            short_code=short_code
        )

        short_url = request.build_absolute_uri(f'/{short_code}/')

        return render(request, 'shortener/result.html', {
            'short_url': short_url,
            'original_url': original_url,
            'alias': short_code
        })

    return redirect('index')


def redirect_url(request, short_code):
    url_obj = get_object_or_404(URL, short_code=short_code)

    # ✅ Expiry check
    if url_obj.expiry_date and timezone.now() > url_obj.expiry_date:
        return render(request, 'shortener/error.html', {
            'message': 'This link has expired!'
        })

    # ✅ Increment clicks safely
    url_obj.clicks += 1
    url_obj.save(update_fields=['clicks'])

    return redirect(url_obj.original_url)


def check_alias(request):
    alias = request.GET.get('alias', '')
    if alias is None:
        return JsonResponse({'available': False, 'error': 'No alias provided'}, status=400)

    alias = alias.strip()
    # Validate alias format
    if not re.match(r'^[a-zA-Z0-9_-]+$', alias):
        return JsonResponse({'available': False, 'error': 'Invalid alias format'}, status=400)

    exists = URL.objects.filter(short_code=alias).exists()
    return JsonResponse({'available': not exists})