# Local LLM Inference

1. For downloading and running model in kubernetes we use https://llmkube.com/
2. For accessing the LLM outside kubernetes cluster and routing between provider we use https://agentgateway.dev/docs/kubernetes/latest/

Read documentation and getting started guild at

https://agentgateway.dev/docs/kubernetes/latest/

https://llmkube.com/


# Example AgentgatewayBackend CRD definition

Read more at https://docs.solo.io/agentgateway/latest/reference/api/api/

```yaml
apiVersion: agentgateway.dev/v1alpha1
kind: AgentgatewayBackend
metadata:
  name: gemini
spec:
  ai:
    provider:
      gemini:
        model: gemini-2.5-flash
  policies:
    auth:
      secretRef:
        name: gemini-secret
```        



# Example HttpRoute

```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: llm-route
  namespace: default
spec:
  parentRefs:
    - name: agentgateway
      namespace: default
  rules:
    - matches:
      - path: 
          type: PathPrefix
          value: /ai/gemini
      filters:
      - type: URLRewrite
        urlRewrite:
          path:
            type: ReplacePrefixMatch
            replacePrefixMatch: /
      backendRefs:
      - name: gemini
        namespace: default
        group: agentgateway.dev
        kind: AgentgatewayBackend
```

```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: llm-route
  namespace: default
spec:
  parentRefs:
    - name: agentgateway
      namespace: default
  rules:
    - matches:
      - path: 
          type: PathPrefix
          value: /ai/gemini
      filters:
      - type: URLRewrite
        urlRewrite:
          path:
            type: ReplacePrefixMatch
            replacePrefixMatch: /
      backendRefs:
      - name: gemini
        namespace: default
        group: agentgateway.dev
        kind: AgentgatewayBackend
```        