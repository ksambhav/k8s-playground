# Trino Cluster Setup Steps

```shell
helm repo add trino https://trinodb.github.io/charts
```

```shell
helm upgrade --install trino02 trino/trino -n db --create-namespace -f trino/values.yaml
```