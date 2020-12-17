## Objective
The objective of this lesson is to explain the concept of process types and how you can use process types to support the [Concurrency](https://12factor.net/concurrency) principle of 12 Factor App.

## Understaning concurrency

A process type is an grouping of application processes according to semanatic definition. For example, in the demonstration application *Food Court* ther are three process types, `consumer`, `provider` and `persistence`. (The names we assign to the process type group are arbitrary.)

![Food Court](12factor-008/assets/process-types.jpg)

The `customer` service is a process type, `consumer` because it consumes data from the `provider` type.

The `provider` process type are the restaurants in *Food Court*, `burgerqueen`, `iowafried` and `hobos`. These resturants provide data in the form of meals to the `customer`.

The `persistence` provider types because the persist data from the `provider` process types.

The relevance to the the [Concurrency](https://12factor.net/concurrency) principle of 12 Factor App is this: you want to have your application segmented according to process type so that you can scale of a particular process type independent of other process types. For example, if too much stress is applied the `collector`, you can simply increase the number of `collector` process independent of the other process types.

The same is true of the `provider` process types. If `burgerqueen` becomes too stressed, we can scale up its processes. (In this case all processes are Kubernetes pods. Each pod contains an instance of the given restaurant.)

The benefit of [Concurrency](https://12factor.net/concurrency) is that there it offers a great deal flexiblity in terms of scale and resource consumption.

The following steps will show you the current state of the process (pod) allocation of the components that make up the demonstration application, *Food Court*.

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute T1}}

You should see the following output:

`/root/12factor`

**Step 2:** Take a look at the pods running the Kubernetes cluster

`kubectl get deployment`{{execute T1}}

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

Each of [Kubernetes deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) shown above represent a collection of pods (processes) running under a corresponding Kubernetes service. Notice that each deployment has only 1 pod running. (The `READY` column. `1/1` means that each deployment has been allocated 1 pod and one is running.)

Now, what were to happens if the `customer`, `hobos` and `collector` components were subject to increased stress, but the levels of stress were different for each? Of course we would increase the number of processes running for each component. But, because we're support the [Concurrency](https://12factor.net/concurrency) principle of 12 Factor App, we can increase the pod allocation for each separately and independently.

We'll increase the allocations accordingly in the next lesson. 


---

***Next: Affecting the Demonstration Application's Process Concurrency**