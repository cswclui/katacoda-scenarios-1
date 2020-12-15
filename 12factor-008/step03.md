## Objective
The objective of this lesson is demonstrate how to [TO BE PROVIDED]

## Steps

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute T1}}

You should see the following output:

`/root/12factor`

**Step 2:** Take a look at the pods running the Kubernetes cluster

`kubectl get deployment`{{execute T1}}

You'll see out put similar to the following:

```

NAME                                      READY   STATUS    RESTARTS   AGE
burgerqueen-deployment-85d79b9cd6-ch89g   1/1     Running   0          10m
collector-deployment-7b5888b4f4-5zcb5     1/1     Running   0          10m
customer-deployment-cbdc5b964-6znpg       1/1     Running   0          10m
hobos-deployment-fdc5f48d-sjn4h           1/1     Running   0          10m
iowafried-deployment-7d5868d479-n986n     1/1     Running   0          10m
redis-deployment-8687bfc768-llk5x         1/1     Running   0          10m

```

[DISCUSSION]


---

***Next: Affecting the Demonstration Application's Process Concurrency**