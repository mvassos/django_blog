FROM python:3.7-alpine
MAINTAINER Manuel Vassos

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

# Set the working directory
RUN mkdir /blog_service
WORKDIR /blog_service

# Copy current directory into container
COPY . /blog_service/

EXPOSE 8000
CMD exec gunicorn personal_blog.wsgi:application — bind 0.0.0.0:8000 — workers 3

