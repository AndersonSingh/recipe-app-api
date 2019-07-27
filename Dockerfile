# build from this base docker image. 
FROM python:3.7-alpine

# owner information.
MAINTAINER Anderson Singh

# run python in buffered mode, recommended. 
ENV PYTHONUNBUFFERED 1

# cop the requirements from the current directory into the docker image.
COPY ./requirements.txt /requirements.txt

# install the project dependences. 
RUN pip install -r /requirements.txt

# create a app directory on the docker image. 
RUN mkdir /app

# switch the working directory to app. 
WORKDIR /app

# copy the app folder contents to the app folder on the docker image. 
COPY ./app /app

# create a new user called user. -D for running applications. 
RUN adduser -D user

# switch docker to the user we created. 
# we don't want to run as root in the docker image. 
USER user