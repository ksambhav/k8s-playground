# Starrocks MPP Distributed Database

## 1. Introduction

https://artifacthub.io/packages/helm/kube-starrocks/starrocks

```shell
helm repo add starrocks https://starrocks.github.io/starrocks-kubernetes-operator
```

```shell
helm repo update starrocks
```

```shell
helm upgrade --install sr01 starrocks/kube-starrocks --create-namespace -n mydp -f starrocks/sr-native.yml
```


### Add Postgresql database as an external catalog in Starrocks

```sql
CREATE EXTERNAL CATALOG postgres01
PROPERTIES
(
    "type" = "jdbc",
    "user" = "samsfot",
    "password" = "password",
    "jdbc_uri" = "jdbc:postgresql://cluster01-rw:5432/db01",
    "driver_url" = "https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.9/postgresql-42.7.9-all.jar",
    "driver_class" = "org.postgresql.Driver"
);

```