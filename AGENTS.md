# AGENTS.md

## Repository Overview
Kubernetes playground for data infrastructure experimentation. Organized by service directories containing K8s manifests, Helm values, and operators.

## Directory Structure
```
cloudbeaver/   - Database UI (Helm values + route)
dagster/       - Orchestration (Helm values, code-location, sec)
dbt01/elt01/   - dbt project (Trino connection: trino.local:80)
gateway/       - Gateway API (nginx GatewayClass, HTTPRoutes)
jupyter/       - Notebooks (Helm values)
kafka/         - Strimzi Kafka cluster, Kafka UI, connectors
llm/           - llmkube InferenceService (Gemma model)
minio/         - Object storage (Helm values)
monitoring/    - Prometheus/Grafana (Helm values)
mysql/         - MySQL + exporter (Helm values, ServiceMonitor)
nessie/        - Catalog (Helm values)
postgresql/    - CloudNativePG (cnpg.io) operator Cluster CR
redis/         - Cache (Helm values)
starrocks/     - Analytical DB (Helm values)
trino/         - Distributed SQL (Helm values, sample)
```

## Key Conventions

### Networking
- Local domain: `*.local` pointing to 127.0.0.1
- Gateway API: `local-gateway` in `nginx-gateway` namespace
- Services exposed via HTTPRoute (see `gateway/gateway.yaml` for pattern)

### Operators in Use
- **Kafka**: Strimzi operator (`kafka.kafka.strimzi.io/v1beta2`)
- **PostgreSQL**: CloudNativePG (`postgresql.cnpg.io/v1`)
- **LLM**: llmkube (`inference.llmkube.dev/v1alpha1`)

### dbt Project (`dbt01/elt01/`)
- Profile: `elt01` → Trino at `trino.local:80`
- Target database: `wh02`, schema: `samsoft`
- Commands: `dbt run`, `dbt test`

## Common Commands

### Kafka (Strimzi)
```bash
helm upgrade --install my-strimzi-kafka-operator oci://quay.io/strimzi-helm/strimzi-kafka-operator -n kafka
helm repo add kafka-ui https://ui.charts.kafbat.io/
helm upgrade --install my-kafka-ui kafka-ui/kafka-ui -n kafka -f kafbat.yaml
```

### Pattern Verification
After deploying:
```bash
kubectl rollout status deployment/<name> -n <namespace>
kubectl get pods -n <namespace> -w
kubectl describe pod/<pod-name> -n <namespace>
```

## Secrets / Credentials (Dev Only)
PostgreSQL (cnpg):
- username: `samsoft` (base64: `c2Ftc29mdAo=`)
- password: `password` (base64: `cGFzc3dvcmQ=`)

## Active Skill
- `kubernetes-specialist` loaded for K8s manifest creation, RBAC, NetworkPolicies, troubleshooting
