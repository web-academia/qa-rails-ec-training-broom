# qa-rails-ec-training-broom
rails共同開発講座11期のリポジトリ

# Member
- Tatty
  - 好きなメソッド: allow_any_instance_of
- たいし
  - 好きなメソッド: pluck
- 安藤
  - 好きなメソッド: find_by

## Docker操作
ゼロからdocker環境を立ち上げる場合は、上から順にコマンドを実行すればOK

### docker-compose.ymlファイルを生成
WindowsとMacで使用する内容が異なるため、以下のどちらかの内容をコピペしてdocker-compose.ymlに転記し、コメントアウトを外して使用してください。
- Windowsの場合 -> docker-compose-for-windows.ymlの内容を使用
- Macの場合 -> docker-compose-for-mac.ymlの内容を使用

### docker imageのビルド
```
docker-compose build
```
### docker-compose起動
```
docker-compose up
```
`docker-compose up --build`にすると、`docker-compose up` の前に`docker-compose build`を自動的に実行してくれる
`docker-compose up -d`にすると、バックグラウンドでdocker-composeが起動する

### docker-composeで起動しているコンテナを確認する
```
docker-compose ps
```

### docker環境でbundle install
```
docker-compose exec web bundle install # docker-composeを起動中の場合
docker-compose run web bundle install # docker-composeを起動していない場合
```
`docker-compose run --rm web bundle install`で、bundle installしながらdocker-composeが起動し、install完了後コンテナが停止する
### railsコマンドを実行する
##### docker-composeで起動しているコンテナに入る
コンテナに入った後、railsコマンドが実行できる
```
docker-compose exec web bash
```
- DBを作成する
```
# rails db:create
```
- マイグレーション実行
```
# rails db:migrate
```
※railsページが見れるようになります。http://localhost:3000/

- コンテナから出る
```
# exit
```
##### ※コンテナに入らずrailsコマンド実行する方法
コンテナに入らず`docker-compose exec web`の引数に指定したrailsコマンドを実行します。
```
例：

docker-compose exec web rails db:create

docker-compose exec web rails db:migrate
```
### 起動中のdocker-composeコンテナを停止
```
docker-compose stop
```
`docker-compose down`を実行すると、`docker-compose stop`後に`docker-compose rm`を自動的に実行してくれる
停止した後起動したい場合は、`docker-compose up`,又は`docker-compose start`を実行する

### ログの確認
```
docker-compose logs
```
### 停止中のdocker-composeコンテナの削除
※対象：カレントディレクトリのdocker-composeコンテナ
```
docker-compose rm
```
### Dockerのイメージ、コンテナ、ネットワーク、ボリューム一括削除
- 未使用なイメージ、コンテナ、ネットワークを一括削除（volumeも含め全て削除）
```
docker system prune -a --volumes
```
### Dockerコンテナ一覧表示
```
docker ps

docker-compose ps
```
※-aオプションをつけると終了したコンテナも表示される

## Webpacker configuration file not found /myapp/config/webpacker.yml が出たときの対処法
`docker-compose run --rm web rails webpacker:install`を実行

## Dockerコンテナが落ちる問題の対処法

#### 発生状態
`docker-compose up`を実行しdockerコンテナが正常に起動せず、logに以下の様に出力されます。
```
========================================
  Your Yarn packages are out of date!
  Please run `yarn install --check-files` to update.
========================================
```

#### 原因と対処法

以下の方法で、yarnを再インストールしてください。（更新される様です。）
※実行前にdockerコンテナを`docker-compose stop`で落としてください。
```
$ docker-compose run --rm web yarn install
```

※実行後に、もし正常に起動していないようでしたら
　dockerコンテナ削除後に、`docker-compose up`で再度起動してください。

[この問題についての詳細はこちら]
https://qiita.com/yama_ryoji/items/1de1f2e9e206382c4aa5

### dockerでbinding.pryをする方法

コード上でbinding.pryを挟んだ時に、dockerで確認する方法は
以下のコマンドをターミナルで実行してください
```
docker attach qa-rails-ec-training-[クラス名]-web-1
```
そうすると、docker上でbinding.pryを使えるようになります。
ただ、どこで止まっているかがわからないので、上記コマンドの後に
`@`を入力してください
