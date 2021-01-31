## Objective

The objective of this lesson is to confirm that Kubernetes is up and running that the automatically installed Load Balancer is operational


## What to expect

This scenario preloads a multi-node Kubernetes cluster that is created using Kubernetes in Docker ([`KinD`](https://kind.sigs.k8s.io/)). There will be on control plane node and two worker nodes. When you start out you might see the cluster spinning up in the teminal pane like so:

```
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.19.1) 🖼
 ✓ Preparing nodes 📦 📦 📦
 ✓ Writing configuration 📜
 ✓ Starting control-plane 🕹️
 ✓ Installing CNI 🔌
 ✓ Installing StorageClass 💾
 ✓ Joining worker nodes 🚜
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Have a nice day! 👋
```

The setup also loads a Load Balancer that will provide an IP address that allows external access to the Kubernetes cluster. You can verify that the Load Balancer is working by executing the following command:

`kubectl get services`{{execute}}

You might get output as follows that says the assignment of an IP address to the Load Balancer is `<pending>`.

```
NAME         TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP      10.96.0.1      <none>        443/TCP        44s
nginx        LoadBalancer   10.96.126.61   <pending>     80:30675/TCP   0s
```

Give it a few minutes, then execute:

`kubectl get services`{{execute}}

You'll get the output similar to thge following means the Load Balancer is operational:

```
NAME         TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)        AGE
kubernetes   ClusterIP      10.96.0.1      <none>         443/TCP        3m14s
nginx        LoadBalancer   10.96.126.61   172.19.255.1   80:30675/TCP   2m30s

```

***AGAIN: Be patient! It takes time for the Kubernetes cluster and Load Balancer to install. This can take two or three minutes.***

----

***Next: Installing Istio***