#!/bin/bash

echo "Kube Admin Reset"
sudo kubeadm reset -f

echo "Remove all packages related to Kubernetes"
sudo apt remove -y kubeadm kubectl kubelet kubernetes-cni 
sudo apt purge -y kube*

echo "Remove Docker images (optional if using Docker)"
# Note: Docker doesn't support '-y' for automatic yes to prompts in 'docker image prune'.
# You can use 'yes | command' to auto-confirm, but be cautious with this approach.
sudo docker image prune -a

echo "Removing Docker and its associated packages..."
sudo apt-get remove docker docker-engine docker.io containerd runc -y

echo "Removing any residual packages and dependencies..."
sudo apt-get autoremove -y

echo "Cleaning up Docker's system files..."
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

echo "Cleaning up Kubernetes configuration files..."
sudo rm -rf /etc/kubernetes/
sudo rm -rf $HOME/.kube/

echo "Removing additional Kubernetes and etcd related files and directories..."
sudo rm -rf /etc/cni /var/lib/dockershim /var/lib/etcd /var/lib/kubelet /var/run/kubernetes

echo "Cleanup complete." 
