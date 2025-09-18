```commandline
kubectl create ns dagster
```

```commandline
helm upgrade --install dagster dagster/dagster -n dagster -f values.yaml
```

```commandline
helm upgrade --install user-code dagster/dagster-user-deployments -f code-location.yaml -n dagster
```