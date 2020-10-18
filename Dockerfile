FROM ruby:2.7.1

RUN apt-get update -qq \
  && apt-get install -y build-essential postgresql-client libpq-dev nodejs libssl-dev apt-transport-https ca-certificates

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y yarn

RUN mkdir /bt-api
WORKDIR /bt-api
COPY Gemfile /bt-api/Gemfile
COPY Gemfile.lock /bt-api/Gemfile.lock

COPY . /bt-api
