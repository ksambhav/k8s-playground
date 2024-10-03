# Data Warehouse

### [Minio](https://min.io/docs/minio/kubernetes/upstream/operations/install-deploy-manage/deploy-operator-helm.html)

```commandline
helm repo add minio-operator https://operator.min.io
```

```commandline
helm upgrade --install --namespace data-warehouse --create-namespace operator minio-operator/operator
```