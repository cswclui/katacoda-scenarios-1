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

**Step 6**  Get the external IP address of the `customer` service

`kubectl get svc`{{execute T1}}

You get output similar to the following:


```
TBP

```

**Step 7** Call the service 20 times

```
TBP

```

---

***Next: Learning About Process Concurrency According to Type***