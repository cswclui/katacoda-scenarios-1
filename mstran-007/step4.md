In the last step you got the DaemonSet up and running. Now, let's look at its behavior.


You'll take a look at the logs from the DaemonSet's container. 

**Task 1:** Get the pod name:

`kubectl get pods`{{execute}}

**Task 3:** Then look at the output from a container's logs.

`kubectl logs -l name=dumbdaemon`{{execute}}

You'll see output similar to the following:

```text
{ stooge: 'moe', emitTime: 2019-08-27T21:28:11.001Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:12.002Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:13.001Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:14.001Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:15.002Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:16.001Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:17.001Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:18.001Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:19.001Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:20.002Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:21.003Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:22.003Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:23.002Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:24.002Z }
{ stooge: 'moe', emitTime: 2019-08-27T21:28:25.002Z }
```

The [daemonset](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) has been successfully installed
and is operational.

**Congratulations!** Now, you've completed this lab.