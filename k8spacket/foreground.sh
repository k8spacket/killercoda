echo "Installing tools..."
while [ ! -f /tmp/finished ]; do sleep 1; done

kubectl -n monitoring wait --for=condition=Ready pod -l app.kubernetes.io/name=grafana

echo "Everything is ready"