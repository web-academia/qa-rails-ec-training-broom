FROM ruby:3.0.5

# Using Node.js v14.x(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -

RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y yarn nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# イメージ実行時に起動させる主プロセスを設定
EXPOSE  3000
CMD rm -f tmp/pids/server.pid && rails s -b '0.0.0.0'
