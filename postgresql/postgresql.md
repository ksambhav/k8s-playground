# Install CNPG Operator

```bash
kubectl apply --server-side -f \
  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.28/releases/cnpg-1.28.1.yaml
```

```shell
kubectl apply -f postgresql/single-node.yml -n mydp
```