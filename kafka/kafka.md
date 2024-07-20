### Install Kafka using [Strimzi](https://strimzi.io/)

```commandline
kubectl create namespace kafka
```

```commandline
kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
```

```commandline
kubectl apply -f kafka\strimzi.yaml -n kafka
```

Import Strimzi curated Grafana Dashboard
from https://github.com/strimzi/strimzi-kafka-operator/tree/main/examples/metrics/grafana-dashboards