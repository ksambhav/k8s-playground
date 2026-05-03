## Strimzi Operator Helm

```shell
helm upgrade --install my-strimzi-kafka-operator oci://quay.io/strimzi-helm/strimzi-kafka-operator -n kafka
```

```shell
kubectl create secret docker-registry ghcr-auth \
    --docker-server=https://ghcr.io \
    --docker-username=YOUR_GITHUB_USERNAME \
    --docker-password=YOUR_PERSONAL_ACCESS_TOKEN \
    --docker-email=YOUR_EMAIL
```

```shell
helm repo add kafka-ui https://ui.charts.kafbat.io/
```

```shell
helm upgrade --install my-kafka-ui kafka-ui/kafka-ui -n kafka -f kafbat.yaml
```