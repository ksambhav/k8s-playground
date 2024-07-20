#### The official https://dev.mysql.com/doc/mysql-operator/en/

```commandline
helm repo add mysql-operator https://mysql.github.io/mysql-operator/
```

```commandline
kubectl create namespace mysql
```

```commandline
helm install mysql-operator mysql-operator/mysql-operator --namespace mysql
```

```commandline
helm upgrade --install mysql-db mysql-operator/mysql-innodbcluster -n mysql --values database/mysql-values.yaml
```

The MySQL cli can then be accessed from pod using `mysql -u admin -p`

```commandline
kubectl apply -f database/mysql-pod-monitor.yaml -n mysql
```

#### MySQL Monitoring using https://artifacthub.io/packages/helm/prometheus-community/prometheus-mysql-exporter

https://github.com/prometheus/mysqld_exporter

Create user in MySQL

```commandline
CREATE USER 'exporter'@'%' IDENTIFIED BY 'password' WITH MAX_USER_CONNECTIONS 3;
```

```commandline
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'%';
```

```commandline
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

```commandline
helm install mysql-exporter prometheus-community/prometheus-mysql-exporter -n mysql
```

```commandline
helm upgrade --install mysql-exporter prometheus-community/prometheus-mysql-exporter --values .\database\mysql-exporter.yaml -n mysql
```

#### Import Grafana MySQL Dashboard https://grafana.com/grafana/dashboards/14057-mysql/
