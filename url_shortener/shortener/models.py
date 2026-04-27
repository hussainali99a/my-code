from django.db import models
from django.utils import timezone

class URL(models.Model):
    original_url = models.URLField()
    short_code = models.CharField(max_length=10, unique=True)
    created_at = models.DateTimeField(default=timezone.now)
    clicks = models.PositiveIntegerField(default=0)
    expiry_date = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"{self.short_code} -> {self.original_url}"