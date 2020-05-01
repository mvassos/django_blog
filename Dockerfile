FROM python:3.7-alpine
MAINTAINER Manuel Vassos

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

# Set the working directory
RUN mkdir /blog_service
WORKDIR /blog_service

# Copy current directory into container
ADD . /blog_service/

EXPOSE 8000
CMD exec gunicorn Manuel_Vassos_Blog.wsgi:application — bind 0.0.0.0:8000 — workers 3

