FROM ruby:latest
RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y ruby
RUN gem install -V sinatra
EXPOSE 9100
COPY ./web.rb /app/web.rb
WORKDIR /app
RUN chmod 777 web.rb
CMD ruby web.rb
