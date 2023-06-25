FROM ruby:3.2.2-alpine

RUN apk add --update --virtual \
    build-dependencies \
    build-base \
    tzdata \
    nodejs \
    yarn \
    mysql-dev \
    mysql-client \
    && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app/

RUN gem install bundler:2.4.10
RUN bundle install



ENTRYPOINT [ "rails","server" ]
CMD ["-b", "0.0.0.0" ]
EXPOSE 3000
