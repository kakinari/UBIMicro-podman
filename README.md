# UBIMicro-podman
このリポシトリはRedhat Enterprise　Linuxを快適にネットワーク上で使用するためのPodを作成するためのスクリプトです。

# 目的

このリポジトリでは主に以下の目的を実現するためのイメージを作成するためのスクリプトを公開しています。

- ネットワーク上のVMやWSL上での機能拡張
- 主に学習のための最新のバージョンの環境の提供
- 使用後の環境の復元の容易さ
- CI / CDなどで使用するコンパイル、実行環境

# イメージレジストリ

実際に作成したイメージはPodmanのレジストリではなくDocker.io上に格納してあります。

Docker.io上のページについては[Docker kakinari](https://hub.docker.com/r/kakinari/ubi-micro-ja)も参照してください。


Podmanを使用する場合
``` Podmanを使用する場合
podman pull docker.io/kakinari/ubi-micro-ja:tagname
```
Dockerを使用する場合
``` Dockerを使用する場合
docker pull kakinari/ubi-micro-ja:tagname
```

## イメージ作成スクリプト
それぞれのフォルダには対応するイメージの作成スクリプトが公開されています。
詳細はそれぞれのフォルダのREADMEを参照してください。
### ubi-micro-9
Redhat Enterprise Linux 9のUBI-Microをベースに日本語環境をデフォルトに設定しているベースイメージ
### ubi-micro-base
ubi-micto-9をベースにC,C++ベースのアプリを実装するためのベースイメージ。　

X-Windowアプリをホスト側で実行できるように設定
### ubi-micro-jbase
ubi-micto-baseをベースにJavaベースのアプリを実装するためのベースイメージ。

日本語表示のためにGoogle noto cjkフォントを追加
### ubi-micro-jbase-nx
ubi-micto-baseをベースにJavaベースのサーバアプリを実装するためのベースイメージ。　

Javaはheadlessを使用
### ubi-micro-dev
ソースコードをコンパイルするために使用するイメージ。

Development Toolsをインストールしている。
Java1.8.0は除外

### ubi-micro-jdev
ubi-micro-devをベースにJavaソースコードをコンパイルするために使用するイメージ。　

java-latest-openjdkを使用

### ubi-micro-sdkman
いくつかの開発環境を設定するためのベースイメージ

### ubi-micro-nvm
Nodeの環境を設定するためのベースイメージ

### ubi-micro-ant
AntをベースにしたJavaの開発環境

ubi-micro-sdkmanをベースにしている

### ubi-micro-gradle
GradleをベースにしたJavaの開発環境

ubi-micro-sdkmanをベースにしている

### ubi-micro-maven
MavenをベースにしたJavaの開発環境

ubi-micro-jdevをベースにしている

### ubi-micro-ruby
Rubyをベースとした開発環境用のベースイメージ

ubi-micro-devをベースにしている

### ubi-micro-jekyll
Jekyllの開発環境

ubi-micro-rubyをベースにしている

### ubi-micro-node
Node.jsの開発環境

ubi-micro-nvmをベースにしている

### ubi-micro-meld
日本語環境のMeldを実行するためのイメージ
### ubi-micro-jmmeter
日本語環境のApache jmeterを実行するためのイメージ
### ubi-micro-tomcat
Tomcatサーバを実行するためのイメージ
### ubi-micro-postgres
Postgres SQLサーバを実行するためのイメージ
### ubi-micro-weblogi
WebLogicサーバを実行するためのイメージ

JavaはOracle Java 11.0を使用している

## UBI-Micro

Podmanでイメージを実行するときにUBI-Microというイメージベースが用意されています。

これはイメージを実行した際にDNFやYUMなどのパッケージ・マネージャをイメージ内に所有していないため、実行中に環境を変更することができないことと、最小限のイメージを作成することができます。

また、PodmanにはSystemdとの連携によってサービスの一つとして扱うことができるため、ホスト側の機能拡張の一つとして使用することが可能です。

例えば、ネットワーク上の最小OSイメージで使用を開始した際に、いきなりTomcatをインストールする際にはJavaの設定やサーバの設定などをかなり手作業で行わなければいけないのですが、この方法であれば、Systemdの定義ファイルをコピーして有効化するだけでサービスを開始できますし、そのマシンにログインされたとしてもパッケージ内のコマンドなどはログインシェルからは直接実行できないため、ある程度のセキュリティ向上にもなります。

