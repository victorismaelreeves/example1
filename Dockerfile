FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y ruby
RUN gem install sinatra
COPY ./web.rb /app/web.rb
WORKDIR /app
RUN chmod 777 web.rb
CMD ruby web.rb
