FROM python:3.7-alpine
MAINTAINER Manuel Vassos

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /personal_blog
WORKDIR /personal_blog
COPY ./personal_blog /personal_blog


RUN adduser -D user
USER user

