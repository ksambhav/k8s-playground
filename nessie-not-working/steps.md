# Nessie Catalog

```shell
helm repo add bitnami https://charts.bitnami.com/bitnami
```

```shell
helm upgrade --install nessie02 -n db oci://registry-1.docker.io/bitnamicharts/nessie --create-namespace -f nessie/values.yaml
```