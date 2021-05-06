#!/bin/bash

# https://docs.openshift.com/container-platform/4.7/monitoring/enabling-monitoring-for-user-defined-projects.html

# Enable user workload monitoring for the cluster
kubectl create -f user-workload-monitoring-config-configmap.yaml
kubectl create -f cluster-monitoring-config-configmap.yaml

# Add pod monitor for strimzi workload
kubectl create namespace strimzi
kubectl create -f strimzi-pod-monitor.yaml

