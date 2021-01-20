![logo](mstran-007/assets/logo-sm.png)
 
 * **Educational Objective**
 * **What You Need To Know Before You Start**
 * **Understanding a Kubernetes Daemonset**
 * **Scenario Contents**
 * **Getting the Source Code from GitHub**
 
------

**IMPORTANT**: You need to do the steps in sequence in order for the state of the lesson's learning environment to be
consistent. Otherwise, you'll get behaviors that might be confusing.

------
 
## Educational Objective
The objective of this scenario is to demonstrate how to create and deploy a Kubernetes
[DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) that is bound to a specific
Kubernetes worker node according to a label that must exist on at least one node in the cluster.


## What You Need To Know Before You Start
In order to get full benefit from the concepts and tasks presented in this scenario you need to have basic understanding
of how to enter commands in the Katacoda interactive learning environment. Each step has commands that can be entered
into the interactive terminal automatically by clicking on the command.

There is no need to type directly into the terminal window. Clicking on a command will automatically execute it.


## Understanding a Kubernetes Daemonset

A Kubernetes DaemonSet is a pod that runs on every worker node in a Kubernetest Cluster once declared.
  
A feature of a DaemonSet is that Kubernetes will assign its container to a node according
to a label(s) that exist on the node. This is also known as *[node affinity](https://www.infracloud.io/kubernetes-node-affinity/)*.
For example in order to create node affinity, you can create a DaemonSet pod that has a container
with the attribute, `nodeSelector` in its manifest, like so:

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

In the code listing above, the attribute declaration of interest is:

```text
nodeSelector:
    stooge: moe
```

When the DaemonSet is created it will look for a Kubernetes node that has a label, `stooge: moe`. If no node
has the label, Kubernetes will not install the  DaemonSet's container. However, once the label is assigned
to the node, Kubernetes is smart enough to install the DaemonSet's container on nodes that have the label.


## Scenario Contents

Here's a listing of the steps you'll take in the scneario.

**Step 1** - Cloning the Demo Code from GitHub 

**Step 2** - Creating and Deploying the DaemonSet

**Step 3** - Labeling the Node to Support the DaemonSet's Node Expectation

**Step 4** - Observing the Results

To proceed, click the `Continue` button.

----

## Getting the Source Code from GitHub
You can view the source code for the`dumbdaemon` container image and the Kubernetes DaemonSet
deployment [here](https://github.com/reselbob/dumbdaemon)