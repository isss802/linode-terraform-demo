# Linode Object Storage Akamai

## 概要

Linode Object Storageを作成し、index.htmlを配置する。

AkamaiのCDNプロダクトであるDownload Delivertyを作成し、オリジンを作成したLinode Object Storageに設定する。

連携の設定はLinodeで作成したAccess Key/Secret Keyを受け渡して設定を行っている。

## 構成図

<img width="800" alt="構成図_pdf" src="https://user-images.githubusercontent.com/4577575/170216193-50ceb7e8-5634-4841-9885-1ca7f903d98b.png">

## Linode Tokenを取得し環境変数に設定

API Tokenの取得はこちらを参照

https://www.linode.com/docs/guides/getting-started-with-the-linode-api/

端末の環境変数にTokenを読み込み
```sh
$ export TF_VAR_token=
```

## Akamai APIの設定

API Keyの発行
https://www.akamai.com/ja/blog/developers/akamai-api-part1-api-client-edgegrid

```sh
$ vim ~/.edgerc

[default]
; Akamai {OPEN} API credentials
client_secret = xxxxxxxxxxxxxxxxxxxxx
host = xxxxxxxxxxxxxxxxxxxxxxxxxxxx.luna.akamaiapis.net
access_token = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
client_token = xxxxxxxxxxxxxxxxxxxxxxxx
```

## Terraform

Kubernetesのクラスターを作成し、ノードを2つ作成する。


```sh
.
├── README.md
├── index.html Object Storageに配置するファイル
├── objectstorage.tf Linode Object Storageの定義
├── property-snippets
│   └── main.json Akamai Propertyの設定ファイル
├── property.tf Akamai Propertyの定義
├── terraform.tf プロバイダーの指定
└── variables.tf 変数の指定
```

## 設定

variables.tfに作成する対象となる情報を記載する。

既存のAkamaiの設定を抽出してTerraformのコードを作成したい場合には、Akamai Terraform CLIを利用して作成すると参考にすることができる。
https://github.com/akamai/cli-terraform

## Apply

```
# 初期化
terraform init
# 確認
terraform plan
# 適用
terraform apply
# 削除
terraform destroy
```
