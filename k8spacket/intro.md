<img src="./k8spacket-and-ebpf2.png" alt="k8spacket-and-ebpf2.png">

What is k8spacket? 

It is the tool to collect information about TCP traffic and TLS connection metadata in the Kubernetes cluster using eBPF and visualize it in Grafana.
<br/> <a style="text-decoration:none;float:right;font-size:16px;" href="https://github.com/k8spacket">
<span style="color:grey;"> View on GitHub </span>
<svg fill="grey" viewBox="0 0 16 16" width="16" height="16"><path d="M8 0c4.42 0 8 3.58 8 8a8.013 8.013 0 0 1-5.45 7.59c-.4.08-.55-.17-.55-.38 0-.27.01-1.13.01-2.2 0-.75-.25-1.23-.54-1.48 1.78-.2 3.65-.88 3.65-3.95 0-.88-.31-1.59-.82-2.15.08-.2.36-1.02-.08-2.12 0 0-.67-.22-2.2.82-.64-.18-1.32-.27-2-.27-.68 0-1.36.09-2 .27-1.53-1.03-2.2-.82-2.2-.82-.44 1.1-.16 1.92-.08 2.12-.51.56-.82 1.28-.82 2.15 0 3.06 1.86 3.75 3.64 3.95-.23.2-.44.55-.51 1.07-.46.21-1.61.55-2.33-.66-.15-.24-.6-.83-1.23-.82-.67.01-.27.38.01.53.34.19.73.9.82 1.13.16.45.68 1.31 2.69.94 0 .67.01 1.3.01 1.49 0 .21-.15.45-.55.38A7.995 7.995 0 0 1 0 8c0-4.42 3.58-8 8-8Z"></path></svg>
</a>
<br/>
Use Grafana dashboards below to see how it works
- [k8spacket - node graph]({{TRAFFIC_HOST1_31400}}/d/fdad1ee1-a619-493d-b0ff-2ca2682fdc57/k8spacket-node-graph) - Graph of TCP connections
- [k8spacket - TLS connections & certificates]({{TRAFFIC_HOST1_31400}}/d/_WjaqJt4k/k8spacket-tls-connections-and-certificates) - Table of TLS handshake processes made in the cluster
- [k8spacket - TLS certificate expiration]({{TRAFFIC_HOST1_31400}}/d/a730b0a6-b02e-4c48-957b-dd8174aef06e/k8spacket-tls-certificate-expiration) - Dashboard with the remaining time until the certificates expire
- [k8spacket dashboards]({{TRAFFIC_HOST1_31400}}/dashboards?tag=k8spacket) - k8spacket dashboards list


- Other stuff
  - [Prometheus]({{TRAFFIC_HOST1_31401}})
