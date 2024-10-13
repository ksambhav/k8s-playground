# Postgresql Cluster

###

[Bitnami Helm Chart](https://artifacthub.io/packages/helm/bitnami/postgresql)

```commandline
kubectl create namespace postgres
```

```commandline
helm upgrade --install my-dbms oci://registry-1.docker.io/bitnamicharts/postgresql -n postgres --values postgresql/postgres-values.yaml
```