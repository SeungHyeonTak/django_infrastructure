FROM python:3.9.5

ENV PYTHONUNBUFFERED 1

WORKDIR /django_Infrastructure

COPY . .

RUN apt-get -y update
RUN apt-get -y install vim

RUN pip install -r requirements.txt

EXPOSE 8000