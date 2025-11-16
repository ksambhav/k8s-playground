# Minio using Bitnami

https://artifacthub.io/packages/helm/bitnami/minio?modal=values

```shell
helm upgrade --install minio01 oci://registry-1.docker.io/bitnamicharts/minio -n db --create-namespace -f minio/minio.yaml
```