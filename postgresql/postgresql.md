# Install CNPG Operator

```bash
kubectl apply --server-side -f \
  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.29/releases/cnpg-1.29.0.yaml
```

```shell
kubectl apply -f postgresql/single-node.yml -n mydp
```