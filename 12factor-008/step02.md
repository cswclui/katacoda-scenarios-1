## Objective
The objective of this lesson is demonstrate how to get the demonstration code up and running

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute T1}}

You should see the following output:

`/root/12factor`

**Step 2:** Check out the `git` branch that contains the source code for this lesson:

`git checkout 8-concurrency.0.0.1`{{execute T1}}

You'll see output as follows:

```
Branch '8-concurrency.0.0.1'
set up to track remote branch '8-concurrency.0.0.1' from 'origin'.
Switched to a new branch '8-concurrency.0.0.1'

```

Create the container images the scenario needs and store them in the Local Container Repository running on `localhost:5000`.

**Step 3:** Execute the bash script that executes the provisioning

`sh docker-seed.sh`{{execute T1}}

**Step 4:** Confirm that the expected the docker images in the Local Container Registry

`curl http://localhost:5000/v2/_catalog`{{execute T1}}

You should see the following as output:

```
{"repositories":["burgerqueen","collector","customer","hobos","iowafried"]}

```

**Step 5**  Seed Kubernetes

`cd ~/12factor/k8s/ && sh generate-k8s-resources.sh`{{execute T1}}

**Step 6** Confirm all the deployments and services are running

`kubectl get deployment`{{execute T1}}

You'll get the following output:

```
deployment.apps/burgerqueen-deployment created
deployment.apps/collector-deployment created
deployment.apps/customer-deployment created
deployment.apps/hobos-deployment created
deployment.apps/iowafried-deployment created
deployment.apps/redis-deployment created
service/burgerqueen created
service/collector created
service/customer created
service/hobos created
service/iowafried created
service/redis created

```

You'll see out put similar to the following:

```
NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
burgerqueen-deployment   1/1     1            1           2m3s
collector-deployment     1/1     1            1           2m2s
customer-deployment      1/1     1            1           2m2s
hobos-deployment         1/1     1            1           2m1s
iowafried-deployment     1/1     1            1           2m1s
redis-deployment         1/1     1            1           2m

```

`kubectl get service`{{execute T1}}

You get output similar to the following:

```
NAME          TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)        AGE
burgerqueen   ClusterIP      10.99.38.60      <none>         80/TCP         5s
collector     ClusterIP      10.98.97.42      <none>         80/TCP         5s
customer      LoadBalancer   10.98.104.91     10.98.104.91   80:32122/TCP   4s
hobos         ClusterIP      10.102.225.246   <none>         80/TCP         4s
iowafried     ClusterIP      10.105.87.146    <none>         80/TCP         4s
kubernetes    ClusterIP      10.96.0.1        <none>         443/TCP        7m14s
redis         ClusterIP      10.98.138.176    <none>         80/TCP         3s

```

Take notice of the `EXTERNAL-IP` of the service `customer`. This is the entry point service into *Food Court* within the Kubernetes cluster. In this case the `EXTERNAL-IP` is `10.98.104.91`.

**Step 6** Confirm that Food Court is running in the Kubernetes cluster by making executing `curl` against `customer`. (Notice that `customer` is running on port `80`. Thus, when we call `curl` we can execute using the service name only and expect that the default HTTP, `80`, port of will be used.

`curl 10.98.104.91`

You get output similar to the following (The restuarant will differ.):

```

{"restaurant":"Iowa Fried Chicken","order":"20 Piece Bucket"},"customer":"Friendly Shopper"}

```

---

***Next: Learning About Process Concurrency According to Type***