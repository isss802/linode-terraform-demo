# Linode Terraform Kubernetes Engine 

## 構成図

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

Kubernetesのクラスターを作成し、ノードを2つ作成する。


```sh
.
├── README.md
├── lke.tf クラスターの作成
├── outputs.tf 必要情報の表示
├── terraform.tf プロバイダーの指定
└── variables.tf 変数の指定
```

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

## 参考

https://www.linode.com/docs/guides/how-to-deploy-an-lke-cluster-using-terraform/
