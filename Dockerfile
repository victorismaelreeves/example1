FROM centos:latest

COPY ./example1 /app/example1

WORKDIR /app

RUN chmod 777 example1

CMD ./example1
