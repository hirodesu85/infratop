FROM ruby:3.1.2

# ライブラリのインストール
RUN apt update -qq &&  apt install -y git imagemagick libmagick++-dev sqlite3

# nodejs 18のインストール
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - &&\
apt-get install -y nodejs
# yarnのインストール
RUN npm install n -g && npm install -g yarn

# Node.jsの実行時オプション設定
ENV NODE_OPTIONS=--openssl-legacy-provider

# ワーキングディレクトリの設定
RUN mkdir /myapp
WORKDIR /myapp

# COPY
COPY . /myapp

# Gemfileのコピーとインストール
RUN bundle install

# プラグインのインストール
RUN yarn add --dev @babel/plugin-proposal-private-methods
RUN yarn add --dev @babel/plugin-proposal-private-property-in-object

# webpackerのコンパイルを実行
RUN rails webpacker:install
RUN rails webpacker:compile


ENTRYPOINT ["bin/docker-entrypoint.sh"]

# サーバの起動
CMD ["rails", "server", "-b", "0.0.0.0"]