# Linode Terraform Kubernetes Engine 

## 構成図

![1](https://user-images.githubusercontent.com/4577575/163385988-51ca7147-8fc4-41cb-b14d-6d4dfeda0b8d.png)

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

## kubeconfigの作成

```
export KUBE_VAR=`terraform output -raw kubeconfig` && echo $KUBE_VAR | base64 -d > lke-cluster-config.yaml
export KUBECONFIG=lke-cluster-config.yaml
kubectl config get-contexts
kubectl get nodes
```

## 参考

https://www.linode.com/docs/guides/how-to-deploy-an-lke-cluster-using-terraform/
