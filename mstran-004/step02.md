## Objective
The objective of this lesson is to get the demonstration code up and running.

## What You'll Be Doing

In this lesson we're going to bring the demonstration code which is a microservices oriented application (MOA) version of the service, *Fortune Cookies* up and running.

## Steps

**Step 1:** Confirm the working directory for the monolithic verison of *Fortune Cookies*.

`clear && cd ~/fortune-cookies/microservice-async && pwd`{{execute T1}}

You'get get the following output:

`/root/fortune-cookies/microservice-async`

**Step 2:** Start the `minikube` server that this demonstration MOA needs in order to work with Kuberenetes

`minikube start`{{execute T1}}

You'll get the following output upon succesful completion:

```
* minikube v1.8.1 on Ubuntu 18.04
* Using the none driver based on user configuration
* Running on localhost (CPUs=2, Memory=2460MB, Disk=145651MB) ...
* OS release is Ubuntu 18.04.4 LTS
* Preparing Kubernetes v1.17.3 on Docker 19.03.6 ...
  - kubelet.resolv-conf=/run/systemd/resolve/resolv.conf
* Launching Kubernetes ...
* Enabling addons: default-storageclass, storage-provisioner
* Configuring local host environment ...
* Waiting for cluster to come online ...
* Done! kubectl is now configured to use "minikube"

```

**Step 3:** In a second terminal window, turn on minikube Load Balancing

`minikube tunnel`{{execute T2}}

---

**WARNING:** As you traverse to and from separate terminal windows in Katacoda, it can take time for the terminal's command prompt (`$`) to appear. Don't click on an instruction in the left side interactive content pane until the command prompt appears.

---

You'll get the following episodic output from the process which will continue to run the third terminal window.

```
Status:
        machine: minikube
        pid: 6655
        route: 10.96.0.0/12 -> 172.17.0.44
        minikube: Running
        services: []
    errors:
                minikube: no errors
                router: no errors
                loadbalancer emulator: no errors
```


**Step 4:** Run the shell script the creates a Local Container Registry and seeds the registry with the containers representing each microservice

`sh docker-seed.sh`{{execute T1}}

Upon successful seeding of the Local Container Registry you'll get the following output:

```
{"repositories":["fortunes","scheduler","sender","targetmockserver","testconsumer","users"]}

```

**Step 5:** Add the Kubernetes pods and services to the Kubernetes cluster running under `minikube`.

`cd kubernetes`{{execute T1}}

`sh generate-k8s-resources.sh`{{execute T1}}

**Step 6:** Check out all went well by listing the pods and services:

`kubectl get pods`{{execute T1}}

**Eventually** you will get output similar to the following. (Interservice intitialization can take time. Be patient for a minute or two.)

```
NAME                            READY   STATUS              RESTARTS   AGE
fortunes                        1/1     Running   2          49s
message-gen                     1/1     Running   0          48s
pingrx                          1/1     Running   0          47s
redis-master-7db7f6579f-wblng   1/1     Running   0          49s
redis-slave-5bdcfd74c7-6x7xs    1/1     Running   0          49s
redis-slave-5bdcfd74c7-txp7b    1/1     Running   0          49s
scheduler                       1/1     Running   2          47s
sender                          1/1     Running   2          47s
users                           1/1     Running   2          46s
```

`kubectl get services`{{execute T1}}

You'll get output similar to the following:

```
fortunes       ClusterIP   10.96.61.209     <none>        80/TCP         63s
kubernetes     ClusterIP   10.96.0.1        <none>        443/TCP        3m30s
message-gen    NodePort    10.99.166.225    <none>        80:31399/TCP   62s
redis-master   ClusterIP   10.100.145.15    <none>        6379/TCP       64s
redis-slave    ClusterIP   10.100.149.68    <none>        6379/TCP       64s
scheduler      ClusterIP   10.99.185.214    <none>        80/TCP         61s
sender         ClusterIP   10.107.205.147   <none>        80/TCP         61s
users          ClusterIP   10.108.31.72     <none>        80/TCP         61s

```

---

***Next: Exercising the code***