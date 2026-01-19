## Interview One-Liners
### What is Ambassador Pattern?
- Ambassador Pattern is a sidecar proxy pattern in Kubernetes where a helper container manages all external communication for the main application, handling cross-cutting concerns like security, rate limiting, retries, and routing.
### Why use Ambassador Pattern?
- It decouples networking and control logic from application code, improving maintainability, security, and scalability.

### How Ambassador Differs from Other Patterns

| Pattern | Purpose |
| :--- | :--- |
| Sidecar | Generic helper |
| Adapter | Data transformation |
| Ambassador | External communication proxy |
| Init Container | Pre-start setup |


### Real-World DevOps Mapping
In production systems, ambassador pattern is used via:

- Envoy / Istio sidecars
- Service Mesh proxies
- API gateways per Pod
- Outbound policy enforcement
- Security & mTLS layers
#### This is exactly how:
- Istio
- Linkerd
- Consul Connect  
  work internally.

### Why This Matters for DevOps Roles
This pattern shows:
- Strong Kubernetes design understanding 
- Platform engineering mindset
-  **Readiness for:**
- SRE
- Platform Engineer
- Infra Architect roles

