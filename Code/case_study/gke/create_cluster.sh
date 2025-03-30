#!/bin/bash
# Step 1: Configure gcloud project and region
gcloud config set project YOUR_PROJECT_ID
gcloud config set compute/zone us-central1-a

# Step 2: Create GKE Cluster
gcloud container clusters create ssi-cluster \
  --num-nodes=3 \
  --machine-type=e2-standard-2 \
  --disk-size=50 \
  --enable-autoscaling --min-nodes=2 --max-nodes=4 \
  --enable-ip-alias

# Step 3: Authenticate kubectl with GKE
gcloud container clusters get-credentials ssi-cluster

# Step 4: Create Namespace
kubectl create namespace ssi

# Step 5-7: Apply deployments
kubectl apply -f deployments/eth-light-node.yaml -n ssi
kubectl apply -f deployments/indy-node.yaml -n ssi
kubectl apply -f deployments/zksync-dev.yaml -n ssi

# Step 8: Smart contract auto-deployment is in the smart-contract folder
