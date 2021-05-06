#!/bin/bash

# Installing the operator
kubectl create -f amq-streams-subscription.yaml

# Define a machineset with taints and tolerations dedicated for kafka brokers
# Don't forget to substitute (kustomize?) the cluster names and machine size
# Ex: kubectl create -f strimzi-kafka-worker-machineset.yaml 

# List the dedicated nodes for kafka brokers if you have not created a machineset particular for it
#for i in ip-10-0-159-172.eu-west-1.compute.internal
#do 
#kubectl label node $i dedicated=Kafka
#kubectl taint node $i dedicated=Kafka:NoSchedule
#
# To delete labels and taints
#kubectl label node $i dedicated-
#kubectl taint node $i dedicated=Kafka:NoSchedule-
#done

## Taint all nodes used by OCS to be used as well for Kafka using the OCS taint:
oc adm taint node <baremetal OCS node here> node.ocs.openshift.io/storage=true:NoSchedule
oc adm taint node <baremetal OCS node here> node.ocs.openshift.io/storage=true:NoSchedule
oc adm taint node <baremetal OCS node here> node.ocs.openshift.io/storage=true:NoSchedule

###kubectl create namespace strimzi

# Create the cluster
kubectl create -f kafka-cluster.yaml

# Create the topics
kubectl create -f test-kafkatopic.yaml
kubectl create -f test-rep-one-kafkatopic.yaml
