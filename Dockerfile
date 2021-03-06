FROM ruby:2.6.6
RUN gem install rails -v '5.2.4.4'
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs default-mysql-client

RUN mkdir /startlens
ENV APP_ROOT /startlens
WORKDIR $APP_ROOT

COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock
RUN gem install bundler && \
    bundle install --without production