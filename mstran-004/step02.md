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

You'll get output similar to the following:

```
NAME        READY   STATUS    RESTARTS   AGE
email       1/1     Running   0          18s
facebook    1/1     Running   0          18s
fortunes    1/1     Running   0          15s
instagram   1/1     Running   0          18s
linkedin    1/1     Running   0          17s
scheduler   1/1     Running   0          16s
sender      1/1     Running   0          16s
sms         1/1     Running   0          17s
twitter     1/1     Running   0          17s
users       1/1     Running   0          16s

```

`kubectl get services`{{execute T1}}

You'll get output similar to the following:

```
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
email        ClusterIP   10.97.47.100     <none>        80/TCP    92s
facebook     ClusterIP   10.107.216.185   <none>        80/TCP    92s
fortunes     ClusterIP   10.97.45.203     <none>        80/TCP    90s
instagram    ClusterIP   10.98.41.69      <none>        80/TCP    92s
kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP   8m39s
linkedin     ClusterIP   10.104.201.201   <none>        80/TCP    91s
scheduler    ClusterIP   10.98.77.10      <none>        80/TCP    91s
sender       ClusterIP   10.109.110.42    <none>        80/TCP    91s
sms          ClusterIP   10.108.136.36    <none>        80/TCP    91s
twitter      ClusterIP   10.96.206.203    <none>        80/TCP    91s
users        ClusterIP   10.104.217.252   <none>        80/TCP    90s

```

**Step 7:**  Wait about 10 seconds for the MOA to warm up and then check the logs of some of the target pods

View the logs for the `sms` target:

`kubectl logs sms -f`{{execute T3}}

You'll get output similar to the following:

```
SMS is sending a POST at Sun Aug 04 2019 17:04:33 GMT+0000 (UTC) with the body {"fortune":"Take care of the pence and the pounds will take care of themselves."}.
SMS is sending a POST at Sun Aug 04 2019 17:04:33 GMT+0000 (UTC) with the body {"fortune":"Necessity is a hard nurse, but she raisesstrong children."}.
SMS is sending a POST at Sun Aug 04 2019 17:04:33 GMT+0000 (UTC) with the body {"fortune":"No news is good news."}.
SMS is sending a POST at Sun Aug 04 2019 17:04:33 GMT+0000 (UTC) with the body {"fortune":"You're never too old to learn."}.
SMS is sending a POST at Sun Aug 04 2019 17:04:33 GMT+0000 (UTC) with the body {"fortune":"It never rains but it pours."}.
SMS is sending a POST at Sun Aug 04 2019 17:04:33 GMT+0000 (UTC) with the body {"fortune":"See nothing, say nothing, know nothing."}.
SMS is sending a POST at Sun Aug 04 2019 17:04:33 GMT+0000 (UTC) with the body {"fortune":"Everyone has a photographic memory, some just don't have film."}.
SMS is sending a POST at Sun Aug 04 2019 17:04:33 GMT+0000 (UTC) with the body {"fortune":"What do you expect from a pig, but a grunt?"}.
SMS is sending a POST at Sun Aug 04 2019 17:04:33 GMT+0000 (UTC) with the body {"fortune":"Honesty is the best policy."}.

```

Shutdown the log stream

`echo "Ctrl+C"`{{execute interrupt T3}}

View the logs for `twitter` target:

`kubectl logs twitter -f`{{execute T3}}

```
TWITTER is sending a POST at Sun Aug 04 2019 17:05:20 GMT+0000 (UTC) with the body {"fortune":"Flattery is all right so long as you don't inhale."}.
TWITTER is sending a POST at Sun Aug 04 2019 17:05:21 GMT+0000 (UTC) with the body {"fortune":"The more you stir, the more it stinks."}.
TWITTER is sending a POST at Sun Aug 04 2019 17:05:22 GMT+0000 (UTC) with the body {"fortune":"If you lose your temper, don't look for it."}.
TWITTER is sending a POST at Sun Aug 04 2019 17:05:23 GMT+0000 (UTC) with the body {"fortune":"As you sow, so shall you reap."}.
TWITTER is sending a POST at Sun Aug 04 2019 17:05:24 GMT+0000 (UTC) with the body {"fortune":"The geek shall inherit the earth."}.
TWITTER is sending a POST at Sun Aug 04 2019 17:05:25 GMT+0000 (UTC) with the body {"fortune":"Procrastination is the thief of time."}.

```
Shutdown the log stream

`echo "Ctrl+C"`{{execute interrupt T3}}

View the logs for `facebook` target:

`kubectl logs facebook -f`{{execute T3}}

```
FACEBOOK is sending a POST at Sun Aug 04 2019 17:05:45 GMT+0000 (UTC) with the body {"fortune":"He who fights and runs away, lives to fight another day."}.
FACEBOOK is sending a POST at Sun Aug 04 2019 17:05:46 GMT+0000 (UTC) with the body {"fortune":"A short cut is often a wrong cut."}.
FACEBOOK is sending a POST at Sun Aug 04 2019 17:05:47 GMT+0000 (UTC) with the body {"fortune":"You can't tell a book by its cover."}.
FACEBOOK is sending a POST at Sun Aug 04 2019 17:05:48 GMT+0000 (UTC) with the body {"fortune":"A drowning man will clutch at a straw."}.
FACEBOOK is sending a POST at Sun Aug 04 2019 17:05:49 GMT+0000 (UTC) with the body {"fortune":"No life can be dreary when work is adelight."}.
FACEBOOK is sending a POST at Sun Aug 04 2019 17:05:50 GMT+0000 (UTC) with the body {"fortune":"You can't live on bread alone."}.

```
Shutdown the log stream

`echo "Ctrl+C"`{{execute interrupt T3}}

The output above indicates that the targets of *Fortnue Cookie* data recieved their fortunes.

---

***Next: Exercising the code***