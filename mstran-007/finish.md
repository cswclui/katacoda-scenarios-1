## You've crossed the finish line!

In this scenario you:

* Create a Kubernetes DaemonSet with node affinity
* Set a label on the worker node to support the DaemonSet's expected node affinity
* Observed Kubernetes automatically propagate the DaemonSet's contiainer to the labeled node
* Observed the DaemonSet's container behavior using:
 
 `kubectl logs POD_NAME`


