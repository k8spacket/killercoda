#!/bin/bash

set -x # to test stderr output in /var/log/killercoda

kubectl taint node controlplane node-role.kubernetes.io/control-plane:NoSchedule-

helm repo add k8spacket https://k8spacket.github.io/k8spacket-helm-chart
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install k8spacket --namespace k8spacket k8spacket/k8spacket --create-namespace

echo "bG9raToKICBlbmFibGVkOiBmYWxzZQoKcHJvbXRhaWw6CiAgZW5hYmxlZDogZmFsc2UKCmZsdWVudC1iaXQ6CiAgZW5hYmxlZDogZmFsc2UKCmFsZXJ0bWFuYWdlcjoKICBlbmFibGVkOiBmYWxzZQoKbm9kZUV4cG9ydGVyOgogIGVuYWJsZWQ6IGZhbHNlCgprdWJlcm5ldGVzU2VydmljZU1vbml0b3JzOgogIGVuYWJsZWQ6IGZhbHNlCgprdWJlQXBpU2VydmVyOgogIGVuYWJsZWQ6IGZhbHNlCgprdWJlbGV0OgogIGVuYWJsZWQ6IGZhbHNlCgpncmFmYW5hOgogIGVuYWJsZWQ6IHRydWUKICBzaWRlY2FyOgogICAgZGFzaGJvYXJkczoKICAgICAgZW5hYmxlZDogdHJ1ZQogIGltYWdlOgogICAgdGFnOiA5LjUuMTMKICBzZXJ2aWNlOgogICAgdHlwZTogTm9kZVBvcnQKICAgIG5vZGVQb3J0OiAzMTQwMAogIGVudjoKICAgIEdGX0lOU1RBTExfUExVR0lOUzogaGFtZWRrYXJiYXNpOTMtbm9kZWdyYXBoYXBpLWRhdGFzb3VyY2UsbWFyY3Vzb2xzc29uLWpzb24tZGF0YXNvdXJjZSxtYXJjdXNvbHNzb24tZHluYW1pY3RleHQtcGFuZWwKICBkYXRhc291cmNlczoKICAgIG5vZGVncmFwaGFwaS1wbHVnaW4tZGF0YXNvdXJjZS55YW1sOgogICAgICBhcGlWZXJzaW9uOiAxCiAgICAgIGRhdGFzb3VyY2VzOgogICAgICAgIC0gbmFtZTogIk5vZGUgR3JhcGggQVBJIgogICAgICAgICAganNvbkRhdGE6CiAgICAgICAgICAgIHVybDogImh0dHA6Ly9rOHNwYWNrZXQuazhzcGFja2V0LnN2Yy5jbHVzdGVyLmxvY2FsOjgwODAvbm9kZWdyYXBoIgogICAgICAgICAgYWNjZXNzOiAicHJveHkiCiAgICAgICAgICBiYXNpY0F1dGg6IGZhbHNlCiAgICAgICAgICBpc0RlZmF1bHQ6IGZhbHNlCiAgICAgICAgICByZWFkT25seTogZmFsc2UKICAgICAgICAgIHR5cGU6ICJoYW1lZGthcmJhc2k5My1ub2RlZ3JhcGhhcGktZGF0YXNvdXJjZSIKICAgICAgICAgIHR5cGVMb2dvVXJsOiAicHVibGljL3BsdWdpbnMvaGFtZWRrYXJiYXNpOTMtbm9kZWdyYXBoYXBpLWRhdGFzb3VyY2UvaW1nL2xvZ28uc3ZnIgogICAgICAgICAgdHlwZU5hbWU6ICJub2RlLWdyYXBoLXBsdWdpbiIKICAgICAgICAgIG9yZ0lkOiAxCiAgICAgICAgICB2ZXJzaW9uOiAxCiAgICBtYXJjdXNvbHNzb24tanNvbi1kYXRhc291cmNlLnlhbWw6CiAgICAgIGFwaVZlcnNpb246IDEKICAgICAgZGF0YXNvdXJjZXM6CiAgICAgICAgLSBuYW1lOiAiSlNPTiBBUEkiCiAgICAgICAgICB1cmw6ICJodHRwOi8vazhzcGFja2V0Lms4c3BhY2tldC5zdmMuY2x1c3Rlci5sb2NhbDo4MDgwL3Rsc3BhcnNlci9hcGkvZGF0YSIKICAgICAgICAgIGFjY2VzczogInByb3h5IgogICAgICAgICAgYmFzaWNBdXRoOiBmYWxzZQogICAgICAgICAgaXNEZWZhdWx0OiBmYWxzZQogICAgICAgICAgcmVhZE9ubHk6IGZhbHNlCiAgICAgICAgICB0eXBlOiAibWFyY3Vzb2xzc29uLWpzb24tZGF0YXNvdXJjZSIKICAgICAgICAgIHR5cGVMb2dvVXJsOiAicHVibGljL3BsdWdpbnMvbWFyY3Vzb2xzc29uLWpzb24tZGF0YXNvdXJjZS9pbWcvbG9nby5zdmciCiAgICAgICAgICB0eXBlTmFtZTogImpzb24tYXBpLXBsdWdpbiIKICAgICAgICAgIG9yZ0lkOiAxCiAgICAgICAgICB2ZXJzaW9uOiAxCgpwcm9tZXRoZXVzOgogIGVuYWJsZWQ6IHRydWUKICBzZXJ2aWNlOgogICAgdHlwZTogTm9kZVBvcnQKICAgIG5vZGVQb3J0OiAzMTQwMQogIGt1YmUtc3RhdGUtbWV0cmljczoKICAgIHJiYWM6CiAgICAgIGNyZWF0ZTogZmFsc2UKICBwcm9tZXRoZXVzU3BlYzoKICAgIGFkZGl0aW9uYWxTY3JhcGVDb25maWdzOgogICAgICAtIGpvYl9uYW1lOiAiazhzcGFja2V0LW1ldHJpY3MiCiAgICAgICAgbWV0cmljc19wYXRoOiAvbWV0cmljcwogICAgICAgIHNjcmFwZV9pbnRlcnZhbDogMjVzCiAgICAgICAga3ViZXJuZXRlc19zZF9jb25maWdzOgogICAgICAgICAgLSByb2xlOiBub2RlCiAgICAgICAgcmVsYWJlbF9jb25maWdzOgogICAgICAgICAgLSBzb3VyY2VfbGFiZWxzOiBbIF9fYWRkcmVzc19fIF0KICAgICAgICAgICAgYWN0aW9uOiByZXBsYWNlCiAgICAgICAgICAgIHJlZ2V4OiAoW146XSspOi4qCiAgICAgICAgICAgIHJlcGxhY2VtZW50OiAkMTo2Njc2CiAgICAgICAgICAgIHRhcmdldF9sYWJlbDogX19hZGRyZXNzX18K" | base64 -d > promop-values.yaml
helm install promop --namespace monitoring prometheus-community/kube-prometheus-stack --create-namespace --set grafana.adminPassword=k8spacket -f ./promop-values.yaml

mkdir dashboards
cd dashboards
echo "YXBpVmVyc2lvbjogdjEKa2luZDogQ29uZmlnTWFwCm1ldGFkYXRhOgogIG5hbWU6IGs4c3BhY2tldC1ub2RlLWdyYXBoLWRhc2hib2FyZAogIGxhYmVsczoKICAgIGdyYWZhbmFfZGFzaGJvYXJkOiAiMSIKICAgIGFwcC5rdWJlcm5ldGVzLmlvL25hbWU6IGdyYWZhbmEKICAgIGRhc2hib2FyZC1wcm92aWRlcjogZGVmYXVsdApkYXRhOgogIGs4c3BhY2tldC1ub2RlLWdyYXBoLWRhc2hib2FyZC5qc29uOiB8LQogICAgewogICAgICAiYW5ub3RhdGlvbnMiOiB7CiAgICAgICAgImxpc3QiOiBbXQogICAgICB9LAogICAgICAiZWRpdGFibGUiOiB0cnVlLAogICAgICAiZmlzY2FsWWVhclN0YXJ0TW9udGgiOiAwLAogICAgICAiZ3JhcGhUb29sdGlwIjogMCwKICAgICAgImlkIjogNCwKICAgICAgImxpbmtzIjogW10sCiAgICAgICJsaXZlTm93IjogZmFsc2UsCiAgICAgICJwYW5lbHMiOiBbCiAgICAgICAgewogICAgICAgICAgImRhdGFzb3VyY2UiOiB7CiAgICAgICAgICAgICJ0eXBlIjogImhhbWVka2FyYmFzaTkzLW5vZGVncmFwaGFwaS1kYXRhc291cmNlIiwKICAgICAgICAgICAgInVpZCI6ICIke2RhdGFzb3VyY2V9IgogICAgICAgICAgfSwKICAgICAgICAgICJncmlkUG9zIjogewogICAgICAgICAgICAiaCI6IDMxLAogICAgICAgICAgICAidyI6IDI0LAogICAgICAgICAgICAieCI6IDAsCiAgICAgICAgICAgICJ5IjogMAogICAgICAgICAgfSwKICAgICAgICAgICJpZCI6IDIsCiAgICAgICAgICAidGFyZ2V0cyI6IFsKICAgICAgICAgICAgewogICAgICAgICAgICAgICJkYXRhc291cmNlIjogewogICAgICAgICAgICAgICAgInR5cGUiOiAiaGFtZWRrYXJiYXNpOTMtbm9kZWdyYXBoYXBpLWRhdGFzb3VyY2UiLAogICAgICAgICAgICAgICAgInVpZCI6ICIke2RhdGFzb3VyY2V9IgogICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgInF1ZXJ5VGV4dCI6ICJuYW1lc3BhY2U9JG5hbWVzcGFjZSZpbmNsdWRlPSRpbmNsdWRlJmV4Y2x1ZGU9JGV4Y2x1ZGUmc3RhdHMtdHlwZT0kc3RhdHN0eXBlIiwKICAgICAgICAgICAgICAicmVmSWQiOiAiQSIKICAgICAgICAgICAgfQogICAgICAgICAgXSwKICAgICAgICAgICJ0aXRsZSI6ICJOb2RlIGdyYXBoIiwKICAgICAgICAgICJ0eXBlIjogIm5vZGVHcmFwaCIKICAgICAgICB9CiAgICAgIF0sCiAgICAgICJyZWZyZXNoIjogIiIsCiAgICAgICJzY2hlbWFWZXJzaW9uIjogMzgsCiAgICAgICJzdHlsZSI6ICJkYXJrIiwKICAgICAgInRhZ3MiOiBbCiAgICAgICAgIms4c3BhY2tldCIKICAgICAgXSwKICAgICAgInRlbXBsYXRpbmciOiB7CiAgICAgICAgImxpc3QiOiBbCiAgICAgICAgICB7CiAgICAgICAgICAgICJjdXJyZW50IjogewogICAgICAgICAgICAgICJzZWxlY3RlZCI6IHRydWUsCiAgICAgICAgICAgICAgInRleHQiOiAiY29ubmVjdGlvbiIsCiAgICAgICAgICAgICAgInZhbHVlIjogImNvbm5lY3Rpb24iCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJoaWRlIjogMCwKICAgICAgICAgICAgImluY2x1ZGVBbGwiOiBmYWxzZSwKICAgICAgICAgICAgImxhYmVsIjogImdyYXBoIG1vZGUiLAogICAgICAgICAgICAibXVsdGkiOiBmYWxzZSwKICAgICAgICAgICAgIm5hbWUiOiAic3RhdHN0eXBlIiwKICAgICAgICAgICAgIm9wdGlvbnMiOiBbCiAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInNlbGVjdGVkIjogdHJ1ZSwKICAgICAgICAgICAgICAgICJ0ZXh0IjogImNvbm5lY3Rpb24iLAogICAgICAgICAgICAgICAgInZhbHVlIjogImNvbm5lY3Rpb24iCiAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAic2VsZWN0ZWQiOiBmYWxzZSwKICAgICAgICAgICAgICAgICJ0ZXh0IjogImJ5dGVzIiwKICAgICAgICAgICAgICAgICJ2YWx1ZSI6ICJieXRlcyIKICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJzZWxlY3RlZCI6IGZhbHNlLAogICAgICAgICAgICAgICAgInRleHQiOiAiZHVyYXRpb24iLAogICAgICAgICAgICAgICAgInZhbHVlIjogImR1cmF0aW9uIgogICAgICAgICAgICAgIH0KICAgICAgICAgICAgXSwKICAgICAgICAgICAgInF1ZXJ5IjogImNvbm5lY3Rpb24sYnl0ZXMsZHVyYXRpb24iLAogICAgICAgICAgICAicXVlcnlWYWx1ZSI6ICIiLAogICAgICAgICAgICAic2tpcFVybFN5bmMiOiBmYWxzZSwKICAgICAgICAgICAgInR5cGUiOiAiY3VzdG9tIgogICAgICAgICAgfSwKICAgICAgICAgIHsKICAgICAgICAgICAgImN1cnJlbnQiOiB7CiAgICAgICAgICAgICAgInNlbGVjdGVkIjogZmFsc2UsCiAgICAgICAgICAgICAgInRleHQiOiAiIiwKICAgICAgICAgICAgICAidmFsdWUiOiAiIgogICAgICAgICAgICB9LAogICAgICAgICAgICAiZGVzY3JpcHRpb24iOiAiIiwKICAgICAgICAgICAgImhpZGUiOiAwLAogICAgICAgICAgICAibGFiZWwiOiAibmFtZXNwYWNlIChyZWdleHApIiwKICAgICAgICAgICAgIm5hbWUiOiAibmFtZXNwYWNlIiwKICAgICAgICAgICAgIm9wdGlvbnMiOiBbCiAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInNlbGVjdGVkIjogdHJ1ZSwKICAgICAgICAgICAgICAgICJ0ZXh0IjogIiIsCiAgICAgICAgICAgICAgICAidmFsdWUiOiAiIgogICAgICAgICAgICAgIH0KICAgICAgICAgICAgXSwKICAgICAgICAgICAgInF1ZXJ5IjogIiIsCiAgICAgICAgICAgICJza2lwVXJsU3luYyI6IGZhbHNlLAogICAgICAgICAgICAidHlwZSI6ICJ0ZXh0Ym94IgogICAgICAgICAgfSwKICAgICAgICAgIHsKICAgICAgICAgICAgImN1cnJlbnQiOiB7CiAgICAgICAgICAgICAgInNlbGVjdGVkIjogZmFsc2UsCiAgICAgICAgICAgICAgInRleHQiOiAiIiwKICAgICAgICAgICAgICAidmFsdWUiOiAiIgogICAgICAgICAgICB9LAogICAgICAgICAgICAiaGlkZSI6IDAsCiAgICAgICAgICAgICJsYWJlbCI6ICJpbmNsdWRlIG5hbWUgKHJlZ2V4cCkiLAogICAgICAgICAgICAibmFtZSI6ICJpbmNsdWRlIiwKICAgICAgICAgICAgIm9wdGlvbnMiOiBbCiAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInNlbGVjdGVkIjogdHJ1ZSwKICAgICAgICAgICAgICAgICJ0ZXh0IjogIiIsCiAgICAgICAgICAgICAgICAidmFsdWUiOiAiIgogICAgICAgICAgICAgIH0KICAgICAgICAgICAgXSwKICAgICAgICAgICAgInF1ZXJ5IjogIiIsCiAgICAgICAgICAgICJza2lwVXJsU3luYyI6IGZhbHNlLAogICAgICAgICAgICAidHlwZSI6ICJ0ZXh0Ym94IgogICAgICAgICAgfSwKICAgICAgICAgIHsKICAgICAgICAgICAgImN1cnJlbnQiOiB7CiAgICAgICAgICAgICAgInNlbGVjdGVkIjogZmFsc2UsCiAgICAgICAgICAgICAgInRleHQiOiAiIiwKICAgICAgICAgICAgICAidmFsdWUiOiAiIgogICAgICAgICAgICB9LAogICAgICAgICAgICAiaGlkZSI6IDAsCiAgICAgICAgICAgICJsYWJlbCI6ICJleGNsdWRlIG5hbWUgKHJlZ2V4cCkiLAogICAgICAgICAgICAibmFtZSI6ICJleGNsdWRlIiwKICAgICAgICAgICAgIm9wdGlvbnMiOiBbCiAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInNlbGVjdGVkIjogdHJ1ZSwKICAgICAgICAgICAgICAgICJ0ZXh0IjogIiIsCiAgICAgICAgICAgICAgICAidmFsdWUiOiAiIgogICAgICAgICAgICAgIH0KICAgICAgICAgICAgXSwKICAgICAgICAgICAgInF1ZXJ5IjogIiIsCiAgICAgICAgICAgICJza2lwVXJsU3luYyI6IGZhbHNlLAogICAgICAgICAgICAidHlwZSI6ICJ0ZXh0Ym94IgogICAgICAgICAgfSwKICAgICAgICAgIHsKICAgICAgICAgICAgImN1cnJlbnQiOiB7CiAgICAgICAgICAgICAgInNlbGVjdGVkIjogZmFsc2UsCiAgICAgICAgICAgICAgInRleHQiOiAiTm9kZSBHcmFwaCBBUEkiLAogICAgICAgICAgICAgICJ2YWx1ZSI6ICJOb2RlIEdyYXBoIEFQSSIKICAgICAgICAgICAgfSwKICAgICAgICAgICAgImhpZGUiOiAyLAogICAgICAgICAgICAiaW5jbHVkZUFsbCI6IGZhbHNlLAogICAgICAgICAgICAibXVsdGkiOiBmYWxzZSwKICAgICAgICAgICAgIm5hbWUiOiAiZGF0YXNvdXJjZSIsCiAgICAgICAgICAgICJvcHRpb25zIjogW10sCiAgICAgICAgICAgICJxdWVyeSI6ICJoYW1lZGthcmJhc2k5My1ub2RlZ3JhcGhhcGktZGF0YXNvdXJjZSIsCiAgICAgICAgICAgICJxdWVyeVZhbHVlIjogIiIsCiAgICAgICAgICAgICJyZWZyZXNoIjogMSwKICAgICAgICAgICAgInJlZ2V4IjogIiIsCiAgICAgICAgICAgICJza2lwVXJsU3luYyI6IGZhbHNlLAogICAgICAgICAgICAidHlwZSI6ICJkYXRhc291cmNlIgogICAgICAgICAgfQogICAgICAgIF0KICAgICAgfSwKICAgICAgInRpbWUiOiB7CiAgICAgICAgImZyb20iOiAibm93LTZoIiwKICAgICAgICAidG8iOiAibm93IgogICAgICB9LAogICAgICAidGltZXBpY2tlciI6IHt9LAogICAgICAidGltZXpvbmUiOiAiIiwKICAgICAgInRpdGxlIjogIms4c3BhY2tldCAtIG5vZGUgZ3JhcGgiLAogICAgICAidWlkIjogImZkYWQxZWUxLWE2MTktNDkzZC1iMGZmLTJjYTI2ODJmZGM1NyIsCiAgICAgICJ2ZXJzaW9uIjogMiwKICAgICAgIndlZWtTdGFydCI6ICIiCiAgICB9" | base64 -d > k8s-packet-node-graph.yaml
echo "YXBpVmVyc2lvbjogdjEKa2luZDogQ29uZmlnTWFwCm1ldGFkYXRhOgogIG5hbWU6IGs4c3BhY2tldC10bHMtY29ubmVjdGlvbnMtZGFzaGJvYXJkCiAgbGFiZWxzOgogICAgZ3JhZmFuYV9kYXNoYm9hcmQ6ICIxIgogICAgYXBwLmt1YmVybmV0ZXMuaW8vbmFtZTogZ3JhZmFuYQogICAgZGFzaGJvYXJkLXByb3ZpZGVyOiBkZWZhdWx0CmRhdGE6CiAgazhzcGFja2V0LXRscy1jb25uZWN0aW9ucy1kYXNoYm9hcmQuanNvbjogfC0KICAgIHsKICAgICAgImFubm90YXRpb25zIjogewogICAgICAgICJsaXN0IjogW10KICAgICAgfSwKICAgICAgImVkaXRhYmxlIjogdHJ1ZSwKICAgICAgImZpc2NhbFllYXJTdGFydE1vbnRoIjogMCwKICAgICAgImdyYXBoVG9vbHRpcCI6IDAsCiAgICAgICJpZCI6IDIwLAogICAgICAibGlua3MiOiBbXSwKICAgICAgImxpdmVOb3ciOiBmYWxzZSwKICAgICAgInBhbmVscyI6IFsKICAgICAgICB7CiAgICAgICAgICAiZGF0YXNvdXJjZSI6IHsKICAgICAgICAgICAgInR5cGUiOiAibWFyY3Vzb2xzc29uLWpzb24tZGF0YXNvdXJjZSIsCiAgICAgICAgICAgICJ1aWQiOiAiJHtkYXRhc291cmNlfSIKICAgICAgICAgIH0sCiAgICAgICAgICAiZmllbGRDb25maWciOiB7CiAgICAgICAgICAgICJkZWZhdWx0cyI6IHsKICAgICAgICAgICAgICAiY29sb3IiOiB7CiAgICAgICAgICAgICAgICAiZml4ZWRDb2xvciI6ICIjZmZmZmZmIiwKICAgICAgICAgICAgICAgICJtb2RlIjogImZpeGVkIgogICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgImN1c3RvbSI6IHsKICAgICAgICAgICAgICAgICJhbGlnbiI6ICJjZW50ZXIiLAogICAgICAgICAgICAgICAgImNlbGxPcHRpb25zIjogewogICAgICAgICAgICAgICAgICAidHlwZSI6ICJjb2xvci10ZXh0IgogICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgICJmaWx0ZXJhYmxlIjogdHJ1ZSwKICAgICAgICAgICAgICAgICJpbnNwZWN0IjogZmFsc2UsCiAgICAgICAgICAgICAgICAibWluV2lkdGgiOiA1MAogICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgImxpbmtzIjogWwogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAidGl0bGUiOiAiU2hvdyBkZXRhaWxzIiwKICAgICAgICAgICAgICAgICAgInVybCI6ICIvZC9fV2phcUp0NGsvazhzcGFja2V0LXRscy1jb25uZWN0aW9ucy1hbmQtY2VydGlmaWNhdGVzP3Zhci1pZD0ke19fZGF0YS5maWVsZHNbXCJpZFwiXX0iCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAibWFwcGluZ3MiOiBbXSwKICAgICAgICAgICAgICAidGhyZXNob2xkcyI6IHsKICAgICAgICAgICAgICAgICJtb2RlIjogImFic29sdXRlIiwKICAgICAgICAgICAgICAgICJzdGVwcyI6IFsKICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICJjb2xvciI6ICIjZmZmZmZmIiwKICAgICAgICAgICAgICAgICAgICAidmFsdWUiOiBudWxsCiAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIF0KICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJvdmVycmlkZXMiOiBbCiAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIm1hdGNoZXIiOiB7CiAgICAgICAgICAgICAgICAgICJpZCI6ICJieU5hbWUiLAogICAgICAgICAgICAgICAgICAib3B0aW9ucyI6ICJpZCIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICAicHJvcGVydGllcyI6IFsKICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICJpZCI6ICJjdXN0b20uaGlkZGVuIiwKICAgICAgICAgICAgICAgICAgICAidmFsdWUiOiB0cnVlCiAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIF0KICAgICAgICAgICAgICB9CiAgICAgICAgICAgIF0KICAgICAgICAgIH0sCiAgICAgICAgICAiZ3JpZFBvcyI6IHsKICAgICAgICAgICAgImgiOiA5LAogICAgICAgICAgICAidyI6IDI0LAogICAgICAgICAgICAieCI6IDAsCiAgICAgICAgICAgICJ5IjogMAogICAgICAgICAgfSwKICAgICAgICAgICJpZCI6IDQsCiAgICAgICAgICAib3B0aW9ucyI6IHsKICAgICAgICAgICAgImNlbGxIZWlnaHQiOiAic20iLAogICAgICAgICAgICAiZm9vdGVyIjogewogICAgICAgICAgICAgICJjb3VudFJvd3MiOiBmYWxzZSwKICAgICAgICAgICAgICAiZW5hYmxlUGFnaW5hdGlvbiI6IGZhbHNlLAogICAgICAgICAgICAgICJmaWVsZHMiOiAiIiwKICAgICAgICAgICAgICAicmVkdWNlciI6IFsKICAgICAgICAgICAgICAgICJzdW0iCiAgICAgICAgICAgICAgXSwKICAgICAgICAgICAgICAic2hvdyI6IGZhbHNlCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJzaG93SGVhZGVyIjogdHJ1ZSwKICAgICAgICAgICAgInNvcnRCeSI6IFsKICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAiZGVzYyI6IHRydWUsCiAgICAgICAgICAgICAgICAiZGlzcGxheU5hbWUiOiAidXNlZFRMU1ZlcnNpb24iCiAgICAgICAgICAgICAgfQogICAgICAgICAgICBdCiAgICAgICAgICB9LAogICAgICAgICAgInBsdWdpblZlcnNpb24iOiAiOS41LjIiLAogICAgICAgICAgInRhcmdldHMiOiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAiY2FjaGVEdXJhdGlvblNlY29uZHMiOiAzMDAsCiAgICAgICAgICAgICAgImRhdGFzb3VyY2UiOiB7CiAgICAgICAgICAgICAgICAidHlwZSI6ICJtYXJjdXNvbHNzb24tanNvbi1kYXRhc291cmNlIiwKICAgICAgICAgICAgICAgICJ1aWQiOiAiJHtkYXRhc291cmNlfSIKICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICJmaWVsZHMiOiBbCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICJqc29uUGF0aCI6ICIkWypdLnNyYyIsCiAgICAgICAgICAgICAgICAgICJuYW1lIjogInNyYyIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICJqc29uUGF0aCI6ICIkWypdLnNyY05hbWUiLAogICAgICAgICAgICAgICAgICAibGFuZ3VhZ2UiOiAianNvbnBhdGgiLAogICAgICAgICAgICAgICAgICAibmFtZSI6ICJzcmNOYW1lIgogICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgImpzb25QYXRoIjogIiRbKl0uc3JjTmFtZXNwYWNlIiwKICAgICAgICAgICAgICAgICAgImxhbmd1YWdlIjogImpzb25wYXRoIiwKICAgICAgICAgICAgICAgICAgIm5hbWUiOiAic3JjTmFtZXNwYWNlIgogICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgImpzb25QYXRoIjogIiRbKl0uZHN0IiwKICAgICAgICAgICAgICAgICAgImxhbmd1YWdlIjogImpzb25wYXRoIiwKICAgICAgICAgICAgICAgICAgIm5hbWUiOiAiZHN0IgogICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgImpzb25QYXRoIjogIiRbKl0uZHN0TmFtZSIsCiAgICAgICAgICAgICAgICAgICJsYW5ndWFnZSI6ICJqc29ucGF0aCIsCiAgICAgICAgICAgICAgICAgICJuYW1lIjogImRzdE5hbWUiCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAianNvblBhdGgiOiAiJFsqXS5kc3RQb3J0IiwKICAgICAgICAgICAgICAgICAgImxhbmd1YWdlIjogImpzb25wYXRoIiwKICAgICAgICAgICAgICAgICAgIm5hbWUiOiAiZHN0UG9ydCIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICJqc29uUGF0aCI6ICIkWypdLmRvbWFpbiIsCiAgICAgICAgICAgICAgICAgICJsYW5ndWFnZSI6ICJqc29ucGF0aCIsCiAgICAgICAgICAgICAgICAgICJuYW1lIjogImRvbWFpbiIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICJqc29uUGF0aCI6ICIkWypdLnVzZWRUTFNWZXJzaW9uIiwKICAgICAgICAgICAgICAgICAgImxhbmd1YWdlIjogImpzb25wYXRoIiwKICAgICAgICAgICAgICAgICAgIm5hbWUiOiAidXNlZFRMU1ZlcnNpb24iCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAianNvblBhdGgiOiAiJFsqXS51c2VkQ2lwaGVyU3VpdGUiLAogICAgICAgICAgICAgICAgICAibGFuZ3VhZ2UiOiAianNvbnBhdGgiLAogICAgICAgICAgICAgICAgICAibmFtZSI6ICJ1c2VkQ2lwaGVyU3VpdGUiCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAianNvblBhdGgiOiAiJFsqXS5pZCIsCiAgICAgICAgICAgICAgICAgICJsYW5ndWFnZSI6ICJqc29ucGF0aCIsCiAgICAgICAgICAgICAgICAgICJuYW1lIjogImlkIgogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgIm1ldGhvZCI6ICJHRVQiLAogICAgICAgICAgICAgICJxdWVyeVBhcmFtcyI6ICIiLAogICAgICAgICAgICAgICJyZWZJZCI6ICJBIiwKICAgICAgICAgICAgICAidXJsUGF0aCI6ICIiCiAgICAgICAgICAgIH0KICAgICAgICAgIF0sCiAgICAgICAgICAidGl0bGUiOiAiVExTIENvbm5lY3Rpb25zIiwKICAgICAgICAgICJ0eXBlIjogInRhYmxlIgogICAgICAgIH0sCiAgICAgICAgewogICAgICAgICAgImRhdGFzb3VyY2UiOiB7CiAgICAgICAgICAgICJ0eXBlIjogIm1hcmN1c29sc3Nvbi1qc29uLWRhdGFzb3VyY2UiLAogICAgICAgICAgICAidWlkIjogIiR7ZGF0YXNvdXJjZX0iCiAgICAgICAgICB9LAogICAgICAgICAgImZpZWxkQ29uZmlnIjogewogICAgICAgICAgICAiZGVmYXVsdHMiOiB7CiAgICAgICAgICAgICAgInRocmVzaG9sZHMiOiB7CiAgICAgICAgICAgICAgICAibW9kZSI6ICJhYnNvbHV0ZSIsCiAgICAgICAgICAgICAgICAic3RlcHMiOiBbCiAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAiY29sb3IiOiAiZ3JlZW4iLAogICAgICAgICAgICAgICAgICAgICJ2YWx1ZSI6IG51bGwKICAgICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICJjb2xvciI6ICJyZWQiLAogICAgICAgICAgICAgICAgICAgICJ2YWx1ZSI6IDgwCiAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIF0KICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJvdmVycmlkZXMiOiBbXQogICAgICAgICAgfSwKICAgICAgICAgICJncmlkUG9zIjogewogICAgICAgICAgICAiaCI6IDI1LAogICAgICAgICAgICAidyI6IDI0LAogICAgICAgICAgICAieCI6IDAsCiAgICAgICAgICAgICJ5IjogOQogICAgICAgICAgfSwKICAgICAgICAgICJpZCI6IDIsCiAgICAgICAgICAib3B0aW9ucyI6IHsKICAgICAgICAgICAgImFmdGVyUmVuZGVyIjogIiIsCiAgICAgICAgICAgICJjb250ZW50IjogIjxkaXY+XG4gIDxzcGFuPkRvbWFpblxuICAgIDxzYW1wPnt7ZG9tYWlufX08L3NhbXA+XG4gIDwvc3Bhbj5cbiAgPHNwYW4+Q2xpZW50IFRMUyB2ZXJzaW9uc1xuICAgIDxzYW1wPnt7Y2xpZW50VGxzVmVyc2lvbnN9fTwvc2FtcD5cbiAgPC9zcGFuPlxuICA8c3Bhbj5DbGllbnQgY2lwaGVyIHN1aXRlc1xuICAgIDxzYW1wIHN0eWxlPVwibGluZS1icmVhazogYW55d2hlcmVcIj57e2NsaWVudENpcGhlclN1aXRlc319PC9zYW1wPlxuICA8L3NwYW4+XG4gIDxzcGFuPlVzZWQgVExTIHZlcnNpb25cbiAgICA8c2FtcD57e3VzZWRUTFNWZXJzaW9ufX08L3NhbXA+XG4gIDwvc3Bhbj5cbiAgPHNwYW4+VXNlZCBjaXBoZXIgc3VpdGVcbiAgICA8c2FtcD57e3VzZWRDaXBoZXJTdWl0ZX19PC9zYW1wPlxuICA8L3NwYW4+XG4gIDxzcGFuPlNlcnZlciBjZXJ0aWZpY2F0ZTxzcGFuIHN0eWxlPVwiZmxvYXQ6cmlnaHQ7Zm9udC1zaXplOjEwcHhcIj5MYXN0IHNjcmFwZTogPHNhbXA+e3tsYXN0U2NyYXBlfX08L3NhbXA+PC9zcGFuPlxuICBWYWxpZCBmcm9tOiA8c2FtcD57e25vdEJlZm9yZX19PC9zYW1wPlxuICBWYWxpZCB0bzogPHNhbXA+e3tub3RBZnRlcn19PC9zYW1wPlxuICA8c3Bhbj5cbiAgICAgIDxzYW1wPnt7c2VydmVyQ2hhaW59fTwvc2FtcD5cbiAgICA8L3NwYW4+XG4gIDwvc3Bhbj5cbiAgPGRpdj4iLAogICAgICAgICAgICAiZGVmYXVsdENvbnRlbnQiOiAiVGhlIHF1ZXJ5IGRpZG4ndCByZXR1cm4gYW55IHJlc3VsdHMuIiwKICAgICAgICAgICAgImVkaXRvciI6IHsKICAgICAgICAgICAgICAiZm9ybWF0IjogImF1dG8iLAogICAgICAgICAgICAgICJoZWlnaHQiOiA0MDAsCiAgICAgICAgICAgICAgImxhbmd1YWdlIjogImh0bWwiCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJlZGl0b3JzIjogWwogICAgICAgICAgICAgICJzdHlsZXMiCiAgICAgICAgICAgIF0sCiAgICAgICAgICAgICJleHRlcm5hbFNjcmlwdHMiOiBbXSwKICAgICAgICAgICAgImV4dGVybmFsU3R5bGVzIjogW10sCiAgICAgICAgICAgICJoZWxwZXJzIjogIiIsCiAgICAgICAgICAgICJyZW5kZXJNb2RlIjogImV2ZXJ5Um93IiwKICAgICAgICAgICAgInN0eWxlcyI6ICIgIGRpdiB7XG4gICAgd2hpdGUtc3BhY2U6IHByZS13cmFwO1xuICB9XG5cbiAgc3BhbiB7XG4gICAgZm9udC13ZWlnaHQ6IGJvbGQ7XG4gICAgY29sb3I6Z3JleTtcbiAgfVxuXG4gIHNhbXAge1xuICAgIGZvbnQtd2VpZ2h0OiBub3JtYWw7XG4gICAgY29sb3I6IHdoaXRlO1xuICB9IiwKICAgICAgICAgICAgIndyYXAiOiB0cnVlCiAgICAgICAgICB9LAogICAgICAgICAgInBsdWdpblZlcnNpb24iOiAiNC4zLjAiLAogICAgICAgICAgInRhcmdldHMiOiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAiY2FjaGVEdXJhdGlvblNlY29uZHMiOiAzMDAsCiAgICAgICAgICAgICAgImRhdGFzb3VyY2UiOiB7CiAgICAgICAgICAgICAgICAidHlwZSI6ICJtYXJjdXNvbHNzb24tanNvbi1kYXRhc291cmNlIiwKICAgICAgICAgICAgICAgICJ1aWQiOiAiJHtkYXRhc291cmNlfSIKICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICJmaWVsZHMiOiBbCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICJqc29uUGF0aCI6ICIkLmRvbWFpbiIsCiAgICAgICAgICAgICAgICAgICJuYW1lIjogImRvbWFpbiIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICJqc29uUGF0aCI6ICIkLnVzZWRUTFNWZXJzaW9uIiwKICAgICAgICAgICAgICAgICAgImxhbmd1YWdlIjogImpzb25wYXRoIiwKICAgICAgICAgICAgICAgICAgIm5hbWUiOiAidXNlZFRMU1ZlcnNpb24iCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAianNvblBhdGgiOiAiJC51c2VkQ2lwaGVyU3VpdGUiLAogICAgICAgICAgICAgICAgICAibGFuZ3VhZ2UiOiAianNvbnBhdGgiLAogICAgICAgICAgICAgICAgICAibmFtZSI6ICJ1c2VkQ2lwaGVyU3VpdGUiCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAianNvblBhdGgiOiAiJC5jbGllbnRUTFNWZXJzaW9ucyIsCiAgICAgICAgICAgICAgICAgICJsYW5ndWFnZSI6ICJqc29ucGF0aCIsCiAgICAgICAgICAgICAgICAgICJuYW1lIjogImNsaWVudFRsc1ZlcnNpb25zIgogICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgImpzb25QYXRoIjogIiQuY2xpZW50Q2lwaGVyU3VpdGVzIiwKICAgICAgICAgICAgICAgICAgImxhbmd1YWdlIjogImpzb25wYXRoIiwKICAgICAgICAgICAgICAgICAgIm5hbWUiOiAiY2xpZW50Q2lwaGVyU3VpdGVzIgogICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgImpzb25QYXRoIjogIiQuY2VydGlmaWNhdGUubm90QmVmb3JlIiwKICAgICAgICAgICAgICAgICAgImxhbmd1YWdlIjogImpzb25wYXRoIiwKICAgICAgICAgICAgICAgICAgIm5hbWUiOiAibm90QmVmb3JlIiwKICAgICAgICAgICAgICAgICAgInR5cGUiOiAic3RyaW5nIgogICAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgImpzb25QYXRoIjogIiQuY2VydGlmaWNhdGUubm90QWZ0ZXIiLAogICAgICAgICAgICAgICAgICAibGFuZ3VhZ2UiOiAianNvbnBhdGgiLAogICAgICAgICAgICAgICAgICAibmFtZSI6ICJub3RBZnRlciIsCiAgICAgICAgICAgICAgICAgICJ0eXBlIjogInN0cmluZyIKICAgICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICJqc29uUGF0aCI6ICIkLmNlcnRpZmljYXRlLnNlcnZlckNoYWluIiwKICAgICAgICAgICAgICAgICAgImxhbmd1YWdlIjogImpzb25wYXRoIiwKICAgICAgICAgICAgICAgICAgIm5hbWUiOiAic2VydmVyQ2hhaW4iCiAgICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAianNvblBhdGgiOiAiJC5jZXJ0aWZpY2F0ZS5sYXN0U2NyYXBlIiwKICAgICAgICAgICAgICAgICAgImxhbmd1YWdlIjogImpzb25wYXRoIiwKICAgICAgICAgICAgICAgICAgIm5hbWUiOiAibGFzdFNjcmFwZSIsCiAgICAgICAgICAgICAgICAgICJ0eXBlIjogInN0cmluZyIKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICJtZXRob2QiOiAiR0VUIiwKICAgICAgICAgICAgICAicXVlcnlQYXJhbXMiOiAiIiwKICAgICAgICAgICAgICAicmVmSWQiOiAiQSIsCiAgICAgICAgICAgICAgInVybFBhdGgiOiAiLyR7aWR9IgogICAgICAgICAgICB9CiAgICAgICAgICBdLAogICAgICAgICAgInRpdGxlIjogIlRMUyBEZXRhaWxzIiwKICAgICAgICAgICJ0eXBlIjogIm1hcmN1c29sc3Nvbi1keW5hbWljdGV4dC1wYW5lbCIKICAgICAgICB9CiAgICAgIF0sCiAgICAgICJyZWZyZXNoIjogIiIsCiAgICAgICJzY2hlbWFWZXJzaW9uIjogMzgsCiAgICAgICJzdHlsZSI6ICJkYXJrIiwKICAgICAgInRhZ3MiOiBbCiAgICAgICAgIms4c3BhY2tldCIKICAgICAgXSwKICAgICAgInRlbXBsYXRpbmciOiB7CiAgICAgICAgImxpc3QiOiBbCiAgICAgICAgICB7CiAgICAgICAgICAgICJjdXJyZW50IjogewogICAgICAgICAgICAgICJzZWxlY3RlZCI6IGZhbHNlLAogICAgICAgICAgICAgICJ0ZXh0IjogIkpTT04gQVBJIiwKICAgICAgICAgICAgICAidmFsdWUiOiAiSlNPTiBBUEkiCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJoaWRlIjogMiwKICAgICAgICAgICAgImluY2x1ZGVBbGwiOiBmYWxzZSwKICAgICAgICAgICAgIm11bHRpIjogZmFsc2UsCiAgICAgICAgICAgICJuYW1lIjogImRhdGFzb3VyY2UiLAogICAgICAgICAgICAib3B0aW9ucyI6IFtdLAogICAgICAgICAgICAicXVlcnkiOiAibWFyY3Vzb2xzc29uLWpzb24tZGF0YXNvdXJjZSIsCiAgICAgICAgICAgICJyZWZyZXNoIjogMSwKICAgICAgICAgICAgInJlZ2V4IjogIiIsCiAgICAgICAgICAgICJza2lwVXJsU3luYyI6IGZhbHNlLAogICAgICAgICAgICAidHlwZSI6ICJkYXRhc291cmNlIgogICAgICAgICAgfSwKICAgICAgICAgIHsKICAgICAgICAgICAgImN1cnJlbnQiOiB7CiAgICAgICAgICAgICAgImlzTm9uZSI6IHRydWUsCiAgICAgICAgICAgICAgInNlbGVjdGVkIjogZmFsc2UsCiAgICAgICAgICAgICAgInRleHQiOiAiTm9uZSIsCiAgICAgICAgICAgICAgInZhbHVlIjogIiIKICAgICAgICAgICAgfSwKICAgICAgICAgICAgImRhdGFzb3VyY2UiOiB7CiAgICAgICAgICAgICAgInR5cGUiOiAibWFyY3Vzb2xzc29uLWpzb24tZGF0YXNvdXJjZSIsCiAgICAgICAgICAgICAgInVpZCI6ICIke2RhdGFzb3VyY2V9IgogICAgICAgICAgICB9LAogICAgICAgICAgICAiZGVmaW5pdGlvbiI6ICIkLmlkIiwKICAgICAgICAgICAgImhpZGUiOiAyLAogICAgICAgICAgICAiaW5jbHVkZUFsbCI6IGZhbHNlLAogICAgICAgICAgICAibXVsdGkiOiBmYWxzZSwKICAgICAgICAgICAgIm5hbWUiOiAiaWQiLAogICAgICAgICAgICAib3B0aW9ucyI6IFtdLAogICAgICAgICAgICAicXVlcnkiOiB7CiAgICAgICAgICAgICAgImNhY2hlRHVyYXRpb25TZWNvbmRzIjogMzAwLAogICAgICAgICAgICAgICJmaWVsZHMiOiBbCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICJqc29uUGF0aCI6ICIkLmlkIgogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgIF0sCiAgICAgICAgICAgICAgIm1ldGhvZCI6ICJHRVQiLAogICAgICAgICAgICAgICJxdWVyeVBhcmFtcyI6ICIiLAogICAgICAgICAgICAgICJ1cmxQYXRoIjogIiIKICAgICAgICAgICAgfSwKICAgICAgICAgICAgInJlZnJlc2giOiAxLAogICAgICAgICAgICAicmVnZXgiOiAiIiwKICAgICAgICAgICAgInNraXBVcmxTeW5jIjogZmFsc2UsCiAgICAgICAgICAgICJzb3J0IjogMCwKICAgICAgICAgICAgInR5cGUiOiAicXVlcnkiCiAgICAgICAgICB9CiAgICAgICAgXQogICAgICB9LAogICAgICAidGltZSI6IHsKICAgICAgICAiZnJvbSI6ICJub3ctNmgiLAogICAgICAgICJ0byI6ICJub3ciCiAgICAgIH0sCiAgICAgICJ0aW1lcGlja2VyIjoge30sCiAgICAgICJ0aW1lem9uZSI6ICIiLAogICAgICAidGl0bGUiOiAiazhzcGFja2V0IC0gVExTIGNvbm5lY3Rpb25zICYgY2VydGlmaWNhdGVzIiwKICAgICAgInVpZCI6ICJfV2phcUp0NGsiLAogICAgICAidmVyc2lvbiI6IDMsCiAgICAgICJ3ZWVrU3RhcnQiOiAiIgogICAgfQ==" | base64 -d > k8s-packet-tls-connections.yaml
echo "YXBpVmVyc2lvbjogdjEKa2luZDogQ29uZmlnTWFwCm1ldGFkYXRhOgogIG5hbWU6IGs4c3BhY2tldC10bHMtY2VydGlmaWNhdGUtZXhwaXJhdGlvbi1kYXNoYm9hcmQKICBsYWJlbHM6CiAgICBncmFmYW5hX2Rhc2hib2FyZDogIjEiCiAgICBhcHAua3ViZXJuZXRlcy5pby9uYW1lOiBncmFmYW5hCiAgICBkYXNoYm9hcmQtcHJvdmlkZXI6IGRlZmF1bHQKZGF0YToKICBrOHNwYWNrZXQtdGxzLWNlcnRpZmljYXRlLWV4cGlyYXRpb24tZGFzaGJvYXJkLmpzb246IHwtCiAgICB7CiAgICAgICJhbm5vdGF0aW9ucyI6IHsKICAgICAgICAibGlzdCI6IFtdCiAgICAgIH0sCiAgICAgICJlZGl0YWJsZSI6IHRydWUsCiAgICAgICJmaXNjYWxZZWFyU3RhcnRNb250aCI6IDAsCiAgICAgICJncmFwaFRvb2x0aXAiOiAwLAogICAgICAiaWQiOiA0NiwKICAgICAgImxpbmtzIjogW10sCiAgICAgICJsaXZlTm93IjogZmFsc2UsCiAgICAgICJwYW5lbHMiOiBbCiAgICAgICAgewogICAgICAgICAgImRhdGFzb3VyY2UiOiAiUHJvbWV0aGV1cyIsCiAgICAgICAgICAiZmllbGRDb25maWciOiB7CiAgICAgICAgICAgICJkZWZhdWx0cyI6IHsKICAgICAgICAgICAgICAiY29sb3IiOiB7CiAgICAgICAgICAgICAgICAibW9kZSI6ICJjb250aW51b3VzLVJkWWxHciIKICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICJtYXBwaW5ncyI6IFtdLAogICAgICAgICAgICAgICJ0aHJlc2hvbGRzIjogewogICAgICAgICAgICAgICAgIm1vZGUiOiAiYWJzb2x1dGUiLAogICAgICAgICAgICAgICAgInN0ZXBzIjogWwogICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgImNvbG9yIjogImdyZWVuIiwKICAgICAgICAgICAgICAgICAgICAidmFsdWUiOiBudWxsCiAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIF0KICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgICJ1bml0IjogImRhdGVUaW1lRnJvbU5vdyIKICAgICAgICAgICAgfSwKICAgICAgICAgICAgIm92ZXJyaWRlcyI6IFtdCiAgICAgICAgICB9LAogICAgICAgICAgImdyaWRQb3MiOiB7CiAgICAgICAgICAgICJoIjogMzEsCiAgICAgICAgICAgICJ3IjogMjQsCiAgICAgICAgICAgICJ4IjogMCwKICAgICAgICAgICAgInkiOiAwCiAgICAgICAgICB9LAogICAgICAgICAgImlkIjogMSwKICAgICAgICAgICJvcHRpb25zIjogewogICAgICAgICAgICAib3JpZW50YXRpb24iOiAiYXV0byIsCiAgICAgICAgICAgICJyZWR1Y2VPcHRpb25zIjogewogICAgICAgICAgICAgICJjYWxjcyI6IFsKICAgICAgICAgICAgICAgICJsYXN0Tm90TnVsbCIKICAgICAgICAgICAgICBdLAogICAgICAgICAgICAgICJmaWVsZHMiOiAiIiwKICAgICAgICAgICAgICAidmFsdWVzIjogdHJ1ZQogICAgICAgICAgICB9LAogICAgICAgICAgICAic2hvd1RocmVzaG9sZExhYmVscyI6IGZhbHNlLAogICAgICAgICAgICAic2hvd1RocmVzaG9sZE1hcmtlcnMiOiB0cnVlCiAgICAgICAgICB9LAogICAgICAgICAgInBsdWdpblZlcnNpb24iOiAiOS41LjIiLAogICAgICAgICAgInRhcmdldHMiOiBbCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAiZGF0YXNvdXJjZSI6ICJQcm9tZXRoZXVzIiwKICAgICAgICAgICAgICAiZWRpdG9yTW9kZSI6ICJjb2RlIiwKICAgICAgICAgICAgICAiZXhlbXBsYXIiOiBmYWxzZSwKICAgICAgICAgICAgICAiZXhwciI6ICJzb3J0KG1pbihrOHNfcGFja2V0X3Rsc19jZXJ0X2V4cGlyeXtkb21haW4hPVwiXCJ9IGFuZCByYXRlKGs4c19wYWNrZXRfdGxzX2NlcnRfZXhwaXJ5X2NvdW50e2RvbWFpbiE9XCJcIn1bJHBhc3RfaW50ZXJ2YWxdKSA+IDApIGJ5IChkb21haW4pXG4gICAgb3JcbiAgICBtaW4oazhzX3BhY2tldF90bHNfY2VydF9leHBpcnl7ZG9tYWluPVwiXCJ9IGFuZCByYXRlKGs4c19wYWNrZXRfdGxzX2NlcnRfZXhwaXJ5X2NvdW50e2RvbWFpbj1cIlwifVskcGFzdF9pbnRlcnZhbF0pID4gMCkgYnkgKGRzdClcbikiLAogICAgICAgICAgICAgICJmb3JtYXQiOiAidGltZV9zZXJpZXMiLAogICAgICAgICAgICAgICJpbnN0YW50IjogdHJ1ZSwKICAgICAgICAgICAgICAiaW50ZXJ2YWwiOiAiIiwKICAgICAgICAgICAgICAibGVnZW5kRm9ybWF0IjogIl9fYXV0byIsCiAgICAgICAgICAgICAgInJhbmdlIjogZmFsc2UsCiAgICAgICAgICAgICAgInJlZklkIjogIkEiCiAgICAgICAgICAgIH0KICAgICAgICAgIF0sCiAgICAgICAgICAidGl0bGUiOiAiVExTIGNlcnRpZmljYXRlIGV4cGlyYXRpb24iLAogICAgICAgICAgInR5cGUiOiAiZ2F1Z2UiCiAgICAgICAgfQogICAgICBdLAogICAgICAicmVmcmVzaCI6ICIiLAogICAgICAic2NoZW1hVmVyc2lvbiI6IDM4LAogICAgICAic3R5bGUiOiAiZGFyayIsCiAgICAgICJ0YWdzIjogWwogICAgICAgICJrOHNwYWNrZXQiCiAgICAgIF0sCiAgICAgICJ0ZW1wbGF0aW5nIjogewogICAgICAgICJsaXN0IjogWwogICAgICAgICAgewogICAgICAgICAgICAiY3VycmVudCI6IHsKICAgICAgICAgICAgICAic2VsZWN0ZWQiOiB0cnVlLAogICAgICAgICAgICAgICJ0ZXh0IjogIjMwbSIsCiAgICAgICAgICAgICAgInZhbHVlIjogIjMwbSIKICAgICAgICAgICAgfSwKICAgICAgICAgICAgImhpZGUiOiAwLAogICAgICAgICAgICAiaW5jbHVkZUFsbCI6IGZhbHNlLAogICAgICAgICAgICAibGFiZWwiOiAiUGFzdCBpbnRlcnZhbCB0byBhbmFseXplIiwKICAgICAgICAgICAgIm11bHRpIjogZmFsc2UsCiAgICAgICAgICAgICJuYW1lIjogInBhc3RfaW50ZXJ2YWwiLAogICAgICAgICAgICAib3B0aW9ucyI6IFsKICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAic2VsZWN0ZWQiOiBmYWxzZSwKICAgICAgICAgICAgICAgICJ0ZXh0IjogIjFtIiwKICAgICAgICAgICAgICAgICJ2YWx1ZSI6ICIxbSIKICAgICAgICAgICAgICB9LAogICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICJzZWxlY3RlZCI6IGZhbHNlLAogICAgICAgICAgICAgICAgInRleHQiOiAiNW0iLAogICAgICAgICAgICAgICAgInZhbHVlIjogIjVtIgogICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInNlbGVjdGVkIjogdHJ1ZSwKICAgICAgICAgICAgICAgICJ0ZXh0IjogIjMwbSIsCiAgICAgICAgICAgICAgICAidmFsdWUiOiAiMzBtIgogICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInNlbGVjdGVkIjogZmFsc2UsCiAgICAgICAgICAgICAgICAidGV4dCI6ICIxaCIsCiAgICAgICAgICAgICAgICAidmFsdWUiOiAiMWgiCiAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAic2VsZWN0ZWQiOiBmYWxzZSwKICAgICAgICAgICAgICAgICJ0ZXh0IjogIjEyaCIsCiAgICAgICAgICAgICAgICAidmFsdWUiOiAiMTJoIgogICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInNlbGVjdGVkIjogZmFsc2UsCiAgICAgICAgICAgICAgICAidGV4dCI6ICIxZCIsCiAgICAgICAgICAgICAgICAidmFsdWUiOiAiMWQiCiAgICAgICAgICAgICAgfSwKICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAic2VsZWN0ZWQiOiBmYWxzZSwKICAgICAgICAgICAgICAgICJ0ZXh0IjogIjEwZCIsCiAgICAgICAgICAgICAgICAidmFsdWUiOiAiMTBkIgogICAgICAgICAgICAgIH0sCiAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgInNlbGVjdGVkIjogZmFsc2UsCiAgICAgICAgICAgICAgICAidGV4dCI6ICIzMGQiLAogICAgICAgICAgICAgICAgInZhbHVlIjogIjMwZCIKICAgICAgICAgICAgICB9CiAgICAgICAgICAgIF0sCiAgICAgICAgICAgICJxdWVyeSI6ICIxbSwgNW0sIDMwbSwgMWgsIDEyaCwgMWQsIDEwZCwgMzBkIiwKICAgICAgICAgICAgInF1ZXJ5VmFsdWUiOiAiIiwKICAgICAgICAgICAgInNraXBVcmxTeW5jIjogZmFsc2UsCiAgICAgICAgICAgICJ0eXBlIjogImN1c3RvbSIKICAgICAgICAgIH0KICAgICAgICBdCiAgICAgIH0sCiAgICAgICJ0aW1lIjogewogICAgICAgICJmcm9tIjogIm5vdy02aCIsCiAgICAgICAgInRvIjogIm5vdyIKICAgICAgfSwKICAgICAgInRpbWVwaWNrZXIiOiB7fSwKICAgICAgInRpbWV6b25lIjogIiIsCiAgICAgICJ0aXRsZSI6ICJrOHNwYWNrZXQgLSBUTFMgY2VydGlmaWNhdGUgZXhwaXJhdGlvbiIsCiAgICAgICJ1aWQiOiAiYTczMGIwYTYtYjAyZS00YzQ4LTk1N2ItZGQ4MTc0YWVmMDZlIiwKICAgICAgInZlcnNpb24iOiAxNCwKICAgICAgIndlZWtTdGFydCI6ICIiCiAgICB9" | base64 -d > k8s-packet-tls-cert-expiry.yaml

kubectl -n monitoring apply --recursive -f .

#kubectl port-forward --address 0.0.0.0 service/k8spacket 8080:8080

touch /tmp/finished