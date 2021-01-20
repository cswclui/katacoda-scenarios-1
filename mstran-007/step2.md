Now, let's deploy the DaemonSet


**Task 1:** Navigate to the source code directory:

`cd dumbdaemon`{{execute}}

**Task 2:** Apply the following manifest to attempt to create the DaemonSet.

`kubectl apply -f k8s/daemonset.yaml`{{execute}}

**Task 3:** See if any pods are running

`kubectl get pods`{{execute}}

You should see a response:

`No resources found.`

This is OK. Of course we want the DaemonSet to run, but it won't. Why? First take a fast look at the daemonset:

`kubectl get ds`{{execute}}

Notice from the result below that the daemonset exists but that nothing is running. Also notice that the
daemonset has a node selector, `stooge=moe `.

```text
NAME             DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
dumb-daemonset   0         0         0       0            0           stooge=moe      38s
```

There's one little problem. There's no node in the cluster that has the label, `stooge:moe`. This is important.

Move on to the next step to learn how to fix the problem and get the DaemonSet up and running.