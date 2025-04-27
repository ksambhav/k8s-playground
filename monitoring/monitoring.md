# How to setup Monitoring

We will be using https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack for monitoring, logging
and alerting requirements. This will help to profile a typical application resources footprint under load.

```commandline
helm repo add grafana https://grafana.github.io/helm-charts
```

```commandline
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

```commandline
helm repo update
```

```commandline
kubectl create namespace monitoring
```

```commandline
helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack -f monitoring/prom-values.yaml -n monitoring
```

### Sample Pod Monitor

```yaml
apiVersion: monitoring.coreos.com/v1
kind: PodMonitor
metadata:
  name: vaaladin-pod-monitor
  labels:
    release: kube-prometheus-stack
spec:
  selector:
    matchLabels:
      app: vaaladin
  podMetricsEndpoints:
    - port: web
      path: /actuator/prometheus
      interval: 5s
      scheme: http
      tlsConfig:
        insecureSkipVerify: true
```

(Optional)
Import [Grafana Dashboard for typical Spring Boot applications](https://grafana.com/grafana/dashboards/12900-springboot-apm-dashboard/)