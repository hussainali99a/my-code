# my-code
## Download MYSQL [here](https://dev.mysql.com/downloads/installer/)
## Microsoft C++ Redistributable Package [here](https://www.techspot.com/downloads/6776-visual-c-redistributable-package.html#google_vignette)
## Project 1 : Data Cleaning and EDA for World layoffs
## Dataset Link : [layoffs.csv](https://github.com/user-attachments/files/19112221/layoffs.csv)
## Feel free to leave your comment on linkdin post and share your code for better analysis.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Project 2 : EDA for Covid deaths(analyzing covid data , finding insights and trends)
## Dataset link1 covidDeaths [here](https://github.com/user-attachments/files/19148332/CovidDeaths.1.xlsx)
## Dataset link2 covidvaccinations [here](https://github.com/user-attachments/files/19148334/CovidVaccinations.1.xlsx)
## Feel free to give your insight on it and share your code for better analysis
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Project 3 : Bike sales analysis(Through Excel)
## Full Excel Sheet [here](Datasets/Excel Project Dataset.xlsx)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Project 4 : Power BI Dashboard
## Dataset [here](Datasets/Apocolypse_dataset.xlsx)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Project 5 : Pizza_sales_analysis
## Description : Analyse the pizza_sales trend using sql and excel , in sql queries are fired to retrieve the data & find the desired outputs.
## Then in Excel data has been clean and processed in order to create dashboard , pivot table sheet , and excel dashboard is added
## For dataset(CSV file) [here](Datasets/pizza_sales.csv)
## For sql Code [here](SQL_project/Pizza_sales.sql)
## For excel(clean and processed data) ,  dashboard and Pivot_table sheet : Datasets/Pizza_sale_analysis_dashboard.xlsx
## Feel free to reach out on linkdin or mail me for new suggestions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## project 6 : Uber ride analysis (June Month)
## Description : Analyse the uber data , used the advanced dax function , taken out many insights
## dataset : go to dataset folders uber_details and location
## For dashboard : do to dashboard folder (.pbix file)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Project 7 : Blinkit Sales Analyis Using Python
## Datset [here](https://github.com/hussainali99a/my-code/tree/main/Datasets)
## for notebook go to python analysis code folder 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Revising Power BI Concept Using Amazon Product sales Analysis
## Go to datasets for Amazon Combined Data [here](https://github.com/hussainali99a/my-code/tree/main/Datasets)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Project 8 : COVID-19 Data Analysis(WHO)
## Go to python_analysis_code on the repo to find the full code

------------------------------------------------------------------------------------------------------------------------------------------------
## URL Shortener (Django)

Simple Django-based URL shortener located in the `url_shortener` folder.

- **Purpose:** create short aliases for URLs, optional custom alias, redirect, and alias availability check.
- **Main app:** `url_shortener/shortener`

Prerequisites
- Python 3.8+ and pip
- A virtual environment (recommended)

Quick setup
```bash
cd url_shortener
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt  # if present, otherwise install Django
python manage.py migrate
```

Run development server
```bash
python manage.py runserver
```

Useful endpoints
- `GET /` — index page with form to shorten URLs
- `POST /shorten/` — submit a URL (and optional `alias`) to create a short link
- `GET /check-alias/?alias=xyz` — JSON endpoint to check alias availability
- `GET /<short_code>/` — redirect to the original URL

Files you may want to edit
- [url_shortener/shortener/views.py](url_shortener/shortener/views.py)
- [url_shortener/shortener/urls.py](url_shortener/shortener/urls.py)
- [url_shortener/.gitignore](url_shortener/.gitignore)

Verification
- After starting the server, test alias availability:
```bash
curl "http://127.0.0.1:8000/check-alias/?alias=test-alias"
# -> {"available": true} or {"available": false}
```

Notes
- The project uses SQLite by default (`db.sqlite3`) — remove it from Git if you don't want to commit it (a `.gitignore` was added).
- If you want me to add a `requirements.txt` or Dockerfile, tell me and I can scaffold them.
