FROM ruby:3.1.2

RUN apt-get update
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install --yes nodejs && apt-get install --yes sqlite3 libsqlite3-dev

RUN apt-get install imagemagick --yes
RUN apt-get install -y libvips

RUN npm install -g yarn

WORKDIR /usr/src/app

COPY . .

RUN bundle install

RUN gem install foreman

EXPOSE 3000