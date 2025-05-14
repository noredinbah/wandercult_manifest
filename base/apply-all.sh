#!/bin/bash

set -e

echo "🔧 Applying Kubernetes manifests for wandercult..."

kubectl apply -f namespace.yaml

echo "💾 Applying MongoDB PVC..."
kubectl apply -f mongo-pvc.yaml

echo "💾 Applying uploads PVC..."
kubectl apply -f uploads-pvc.yaml

echo "🐳 Deploying MongoDB..."
kubectl apply -f mongodb-deployment.yaml

echo "🚀 Deploying Wandercult app..."
kubectl apply -f app-deployment.yaml

echo "🌐 Applying services..."
kubectl apply -f services.yaml

# echo 🌐 Applying port forading...
# nohup kubectl port-forward -n wandercult --address 0.0.0.0 service/wandercult 6789:3000 > /dev/null 2>&1 &

echo "✅ All resources applied successfully."
