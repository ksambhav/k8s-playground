# Cloudbeaver

https://artifacthub.io/packages/helm/avisto/cloudbeaver

```shell
helm repo add avisto https://avistotelecom.github.io/charts/
```

```shell
helm upgrade --install cloudbeaver avisto/cloudbeaver --create-namespace -n db -f cloudbeaver/beaver.yaml
```