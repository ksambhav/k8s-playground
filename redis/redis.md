```commandline
helm repo add bitnami https://charts.bitnami.com/bitnami
```

```shell
helm install -n justbookit-dev my-redis bitnami/redis -f values.yaml
```