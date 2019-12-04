FROM ruby:2.5.1

COPY . /app
WORKDIR /app

RUN bundle install
EXPOSE 3000
CMD [ "rackup", "--port", "3000", "--host", "0.0.0.0" ]
