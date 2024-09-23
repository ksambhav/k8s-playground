# Postgresql Cluster

###

[Bitnami Helm Chart](https://artifacthub.io/packages/helm/bitnami/postgresql)

```commandline
kubectl create namespace postgres
```

```commandline
helm upgrade --install my-postgres oci://registry-1.docker.io/bitnamicharts/postgresql -n postgres --values postgresql/postgres-values.yaml
```

```commandline
kubectl run my-postgres-postgresql-client --rm --tty -i --restart='Never' --namespace postgres --image docker.io/bitnami/postgresql:16.4.0-debian-12-r9 --env="PGPASSWORD=$POSTGRES_PASSWORD" --command -- psql --host my-postgres-postgresql -U postgres -d postgres -p 5432
```