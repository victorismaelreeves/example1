FROM ruby:latest
WORKDIR /app
COPY web.rb ./
RUN gem install sinatra -v 1.4.8
EXPOSE 9100
WORKDIR /app
RUN chmod 777 web.rb
CMD ruby web.rb
