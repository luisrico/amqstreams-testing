#!/bin/bash

# Add grafana repo to helm
helm repo add grafana https://grafana.github.io/helm-charts

# Install helm with persistence and some tweaks for openshift
helm install grafana grafana/grafana -n strimzi --set securityContext=null --set persistence.enabled=true --set initChownData.enabled=false

# Login with admin username and password from
kubectl get secret grafana -n strimzi -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

# Create a route to the grafana service, edge or without tls
