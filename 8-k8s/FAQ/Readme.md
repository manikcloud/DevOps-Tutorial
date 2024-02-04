

# PodDisruptionBudget (PDB) in Kubernetes

A `PodDisruptionBudget` (PDB) in Kubernetes is a policy that sets limits on the number of Pods of a replicated application that can be simultaneously down among a set of Pods. It helps ensure that a specified minimum number of Pods are always available during voluntary disruptions, such as when performing cluster maintenance (e.g., node upgrades, resizes).

## Key Concepts

- **MinAvailable**: Specifies the minimum number of Pods that should remain available during the disruption.
- **MaxUnavailable**: Defines the maximum number of Pods that can be unavailable during the disruption.

## Usage

PDBs are particularly useful in production environments to maintain application availability during operations that require Pod eviction, like node maintenance.

## Example

A simple PDB might look like this:

```yaml
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: myapp-pdb
spec:
  minAvailable: 2
  selector:
    matchLabels:
      app: myapp
```

---

# Finding Configuration Files in Kubernetes

Kubernetes configuration files are YAML or JSON files that define how resources should be created and managed within the Kubernetes cluster. These files can specify configurations for pods, services, volumes, and more. Here's how you can find and manage these configuration files.

## Locations of Configuration Files

### System-Wide Configuration

- **Kubernetes Master Node**:
  - `/etc/kubernetes/manifests`: Contains static pod manifests for the Kubernetes control plane components (apiserver, controller-manager, scheduler, etc.).
  - `/etc/kubernetes/admin.conf`, `/etc/kubernetes/kubelet.conf`, and `/etc/kubernetes/controller-manager.conf`: Configuration files for accessing the Kubernetes API.

- **Kubelet**:
  - `/var/lib/kubelet/config.yaml`: The primary configuration file for the kubelet.

- **Kubeadm**:
  - `/etc/kubernetes/kubeadm-config.yaml`: The configuration file used by `kubeadm init` and `kubeadm join`.

### User-Defined Resource Configurations

- **Application Specific**: Typically, the configuration files for your applications (pods, deployments, services, etc.) are not stored on the cluster nodes. Instead, they are managed by users and stored wherever is convenient for version control, such as in a Git repository.

---

# Kubernetes Storage and Stateful Workloads Explained

Understanding Persistent Volumes (PV), Persistent Volume Claims (PVC), and StatefulSets is crucial for managing stateful applications in Kubernetes. Here's a surface-level overview of these concepts without diving into specific commands.

## Persistent Volumes (PV)

**Persistent Volumes** are a way for users to manage durable storage in Kubernetes. PVs are resources in the cluster that provision storage, such as disks, that persist beyond the lifecycle of individual pods. Administrators typically create PVs to represent available storage in the cluster.

### Key Points:

- **Cluster Resource**: PVs are a cluster-level resource, meaning they are not tied to a specific namespace.
- **Storage Abstraction**: Provides an abstraction over underlying storage systems, supporting various storage backends like NFS, iSCSI, cloud storage services, and more.
- **Lifecycle Independent**: PVs exist independently of pods, ensuring data persists even when pods are deleted or moved.

## Persistent Volume Claims (PVC)

**Persistent Volume Claims** are requests for storage by users. PVCs specify size, access modes (e.g., read/write), and sometimes specific storage class requirements. Kubernetes matches a PVC to an available PV and binds them together.

### Key Points:

- **User Request**: PVCs allow users to request specific sizes and types of storage.
- **Dynamic Provisioning**: If no suitable PV exists, a new one can be dynamically provisioned according to the requested storage class.
- **Binding**: A PVC is bound to a single PV, creating a one-to-one relationship that reserves the PV for the PVC's use.

## StatefulSets

**StatefulSets** are used to manage stateful applications, providing stable, unique network identifiers, stable persistent storage, and ordered, graceful deployment and scaling.

### Key Points:

- **Stable Identity**: Each pod in a StatefulSet has a unique ordinal index and stable network identity.
- **Ordered Operations**: Pods are created, scaled, and deleted in a predictable order, important for stateful applications like databases that require careful management of replicas.
- **Persistent Storage**: StatefulSets can use PVCs to provide each pod with its persistent storage, ensuring data persists across pod rescheduling and restarts.

### Conclusion

While PVs and PVCs provide the mechanisms for handling persistent storage in Kubernetes, StatefulSets allow for the management of stateful applications, leveraging PVs and PVCs to ensure data persistence. Together, these components enable the deployment and management of complex, stateful applications within a Kubernetes cluster.

## Script Explanation

This guide explains the components of the script that creates Kubernetes resources, including Persistent Volumes (PVs), Persistent Volume Claims (PVCs), and a StatefulSet.

## Components

### Persistent Volume (PV)

- **What it Does**: Creates a PV named `example-pv` with a capacity of 1Gi and a storage class of `standard`.
- **Storage Method**: Utilizes `hostPath` for storage, which mounts a directory from the host. This approach is primarily for testing purposes on a single-node cluster.

### Persistent Volume Claim (PVC)

- **What it Does**: Generates a PVC named `example-pvc` that requests 1Gi of storage with the same storage class, `standard`.
- **Binding**: This PVC is designed to bind to the previously created PV, `example-pv`.

### StatefulSet

- **What it Does**: Constructs a StatefulSet named `example-statefulset` with 2 replicas.
- **Configuration**: Each pod within the StatefulSet mounts the PVC created by the `volumeClaimTemplates`.
- **Use Case**: Provides a simple example that employs an Nginx container to deliver content stored on the persistent volume.

## How to Run

1. **Save the Script**: Store the script in a file, for instance, `create-pv-pvc-statefulset.sh`.
2. **Make Executable**:
   ```bash
   chmod +x create-pv-pvc-statefulset.sh
./create-pv-pvc-statefulset.sh
```

