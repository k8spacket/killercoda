<br>

### Let's learn some Kubernetes - k8spacket

<img src="./k8spacket-and-ebpf2.png" alt="k8spacket-and-ebpf2.png">

What is k8spacket? 

It is the tool to collect information about TCP traffic and TLS connection metadata in the Kubernetes cluster using eBPF and visualize it in Grafana.

Use Grafana dashboards below to see how it works
- [k8spacket - node graph]({{TRAFFIC_HOST1_31400}}/d/fdad1ee1-a619-493d-b0ff-2ca2682fdc57/k8spacket-node-graph) - Graph of TCP connections
- [k8spacket - TLS connections & certificates]({{TRAFFIC_HOST1_31400}}/d/_WjaqJt4k/k8spacket-tls-connections-and-certificates) - Table of TLS handshake processes made in the cluster
- [k8spacket - TLS certificate expiration]({{TRAFFIC_HOST1_31400}}/d/a730b0a6-b02e-4c48-957b-dd8174aef06e/k8spacket-tls-certificate-expiration) - Dashboard with the remaining time until the certificates expire
- [k8spacket dashboards]({{TRAFFIC_HOST1_31400}}/dashboards?tag=k8spacket) - k8spacket dashboards list


- Other stuff
  - [Prometheus]({{TRAFFIC_HOST1_31401}})
