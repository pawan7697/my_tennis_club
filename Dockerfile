FROM python:3.8
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /my_tennis_club
COPY requirements.txt /my_tennis_club/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /my_tennis_club/
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

