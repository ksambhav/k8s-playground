# Jupyter Notebooks

[Helm Chart](https://artifacthub.io/packages/helm/bitnami/jupyterhub)

```commandline
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
```

```commandline
helm upgrade --install --cleanup-on-fail my-jupyter --namespace jupyterhub --create-namespace -f  jupyter/jupyter-values.yaml oci://registry-1.docker.io/bitnamicharts/jupyterhub
```

```commandline
ALTER DATABASE jupyterhub OWNER TO jupyter;
```