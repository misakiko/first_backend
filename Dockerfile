FROM ruby:3.2.0
# rubyのバージョン

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /first_backend
# コンテナ内にfirst_backendディレクトリを作成

WORKDIR /first_backend
# 作成したfirst_backendディレクトリを作業用ディレクトリとして設定

COPY Gemfile /first_backend/Gemfile
COPY Gemfile.lock /first_backend/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のfirst_backendに配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /first_backend
# ローカルのfirst_backend配下のファイルをコンテナ内のfirst_backend配下にコピー