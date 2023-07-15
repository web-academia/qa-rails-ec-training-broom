FROM ruby:3.0.5
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /myapp

# install nodejs(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

# install yarn
RUN npm install --global yarn

# gem
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp


# イメージ実行時に起動させる主プロセスを設定
EXPOSE  3000
CMD rm -f tmp/pids/server.pid && rails s -b '0.0.0.0'
