FROM python:3.9.5

ENV PYTHONUNBUFFERED 1

ARG PROJECT_DIR="/django_Infrastructure"

WORKDIR ${PROJECT_DIR}

COPY . .

RUN apt-get update -y
RUN pip install -U pip
RUN pip install -r requirements.txt

CMD python manage.py migrate; python manage.py runserver 0:80

EXPOSE 80