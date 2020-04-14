# pull official base image
FROM python:3.8.0-alpine
# set work directory
WORKDIR /usr/src/api
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/api/requirements.txt
RUN export LDFLAGS="-L/usr/local/opt/openssl/lib"
RUN pip install -r requirements.txt

#FLASK VARIABLES
ENV FLASK_RUN_PORT=5000

# copy project
COPY . /usr/src/api/
EXPOSE 5000
RUN ls -la /usr/src/api/
RUN ["chmod", "+x", "/usr/src/api/docker-entrypoint.sh"]
ENTRYPOINT ["/usr/src/api/docker-entrypoint.sh"]