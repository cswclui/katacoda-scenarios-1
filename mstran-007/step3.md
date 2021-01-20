Why aren't things working?

**Task 1:** Take a look at the manifest for the DaemonSet:

`cat k8s/daemonset.yaml`{{execute}}

Your output should look like the following:

```text
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: dumb-daemonset
spec:
  template:
    metadata:
      labels:
        name: dumbdaemon # Pod template's label selector
    spec:
      containers:
      - name: dumbdaemon
        image: reselbob/dumbdaemon:v0.1
        imagePullPolicy: IfNotPresent
        env:
          - name: DUMBDAEMON_STOOGE
            value: "moe"
      nodeSelector:
          stooge: moe
  selector:
      matchLabels:
        name: dumbdaemon # Label selector that determines which Pods belong to the DaemonSet
```

Notice that the container has an attribute, `nodeSelector` set to `stooge:moe`.

Let's take a look and the details of the worker node.

**Task 2:** Run the following to get output the describes the node.

`kubectl describe node node01`{{execute}}

You'll observe that `node01` has no label `stooge=moe`.

**Task 3:** Add the required label to the node using the following command:

`kubectl label node node01 stooge=moe`{{execute}}

Once the label is assigned to the node, the DaemonSet will come to life.

**Task 4:** Take another look at the DaemonSet

`kubectl get ds`{{execute}}

Here's the result. The DaemonSet is indeed running because the label has been added to the node.

```text
NAME             DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
dumb-daemonset   1         1         0       1            0           stooge=moe      9m7s
```

Next we'll take a look at the behavior of the DaemonSet.