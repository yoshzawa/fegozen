# ベースイメージを指定
FROM ubuntu:latest

# ラベル情報を追加（任意）
LABEL maintainer="Your Name <your.email@example.com>"

# 環境変数を設定（必要に応じて変更）
ENV FLUTTER_VERSION="2.5.3" \
    FLUTTER_HOME="/usr/local/flutter" \
    PATH="$PATH:/usr/local/flutter/bin"

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y curl git unzip xz-utils libglu1-mesa

# Flutter SDKのインストール
RUN git clone --branch $FLUTTER_VERSION https://github.com/flutter/flutter.git $FLUTTER_HOME && \
    flutter precache

# FlutterのPATHを追加
ENV PATH="$PATH:$FLUTTER_HOME/bin/cache/dart-sdk/bin"

# ワーキングディレクトリを設定（任意）
WORKDIR /app

# その他の設定やアプリのコードを追加する場合はここに追記

# ポートのエクスポート（必要に応じて変更）
EXPOSE 8080

# コンテナ起動時に実行するコマンド（任意）
CMD ["bash"]
