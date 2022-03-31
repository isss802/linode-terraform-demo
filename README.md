# Linode Terraform Demo

## Terraform インストール

```sh
brew install terraform

# バージョン確認
$ terraform version
Terraform v1.1.7
```

## Tokenを取得し環境変数に設定

API Tokenの取得はこちらを参照
https://www.linode.com/docs/guides/getting-started-with-the-linode-api/

端末の環境変数にTokenを読み込み
```sh
$ export TF_VAR_token=
```

## Terraform

Webサーバーを複数台設置し、ロードバランサー配下にします。
また、作成したロードバランサーにDNSレコードを付与するTerraformになります。

```sh
.
├── README.md
├── domain.tf ドメインとレコードの作成
├── firewall.tf ファイアウォールの作成とインスタンスへの付与
├── instance.tf 複数台のWebサーバーを作成しNginxをインストール
├── nodebalancer.tf ロードバランサーを作成しインスタンスへの付与
├── outputs.tf 必要情報の表示
└── variables.tf 変数の指定
```

## 参考
https://www.linode.com/docs/guides/create-a-multicloud-infrastructure-using-terraform/
https://www.linode.com/docs/guides/create-a-nodebalancer-with-terraform/
