#!/bin/bash

echo "Updating and upgrading the package index..."
sleep 2
sudo apt update

echo "Installing necessary packages for transport over HTTPS..."
sleep 2
sudo apt-get install -y apt-transport-https ca-certificates curl

echo "Installing Docker..."
sleep 2
sudo apt install docker.io -y

echo "Starting Docker and enabling it to run on boot..."
sleep 2
sudo systemctl start docker
sudo systemctl enable docker

echo "Adding the Kubernetes signing key..."
sleep 2
curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg

echo "Adding the Kubernetes APT repository..."
sleep 2
echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list

echo "Updating the package index after adding Kubernetes repository..."
sleep 2
sudo apt update 

echo "Installing Kubernetes components (kubeadm, kubectl, kubelet)..."
sleep 2
sudo apt install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y

echo "Initializing Kubernetes cluster with kubeadm..."
sleep 2
sudo kubeadm init

echo "Setting up local kubeconfig..."
sleep 2
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "Applying Weave Net CNI plugin..."
sleep 2
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml


echo "Displaying the status of the nodes in the Kubernetes cluster..."
sleep 2
kubectl get nodes

echo "The Kubernetes cluster setup is complete."
