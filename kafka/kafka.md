## Strimzi Operator Helm

```shell
helm upgrade --install my-strimzi-kafka-operator oci://quay.io/strimzi-helm/strimzi-kafka-operator -n kafka
```

```shell
helm repo add akhq https://akhq.io/
```

```shell
helm upgrade --install akhq akhq/akhq --namespace kafka -f akhq.yaml
```

```shell
kubectl create secret docker-registry ghcr-auth \
    --docker-server=https://ghcr.io \
    --docker-username=YOUR_GITHUB_USERNAME \
    --docker-password=YOUR_PERSONAL_ACCESS_TOKEN \
    --docker-email=YOUR_EMAIL
```