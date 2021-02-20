## Objective

The objective of this scenario is to get the Kiali and Grafana add-ons installed under Istio.

## Steps

**Step 1:** Go the secnario's working directlry

`cd /root/istio-1.8.2`{{execute T1}}

**Step 2:** Install the Add Ons

`kubectl apply -f samples/addons`{{execute T1}}

You might see some error warnings like so:

```
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
unable to recognize "samples/addons/kiali.yaml": no matches for kind "MonitoringDashboard" in version "monitoring.kiali.io/v1alpha1"
```

**The errors shown above are not fatal.** The installation is still operational.

**Step 3:** Confirm that at Add Ons deployment is up and running

`kubectl rollout status deployment/kiali -n istio-system `{{execute T1}}

You'll get output similar to the following:

```
Waiting for deployment spec update to be observed...

Waiting for deployment "kiali" rollout to finish: 0 out of 1 new replicas have been updated...

Waiting for deployment "kiali" rollout to finish: 0 of 1 updated replicas are available...

deployment "kiali" successfully rolled out

```

**Step 5:** Use Kubernetes `port-forwarding` th expose the demonstration API to the outside world.


| **NOTE: Somtimes the command prompt is slow to appear**                           |
|------------------------------------|
| Sometimes wait for a new terminal window to open only to be presented with an empty command line prompt: `$`. In that case, click the command line instruction again in order to enter the command in the interactive terminal window automatically.|


`kubectl port-forward -n istio-system --address 0.0.0.0 service/istio-ingressgateway 80 > /dev/null 2>&1 &`{{execute}}

You'll be presented output similar to the following (The actual value of the process ID, which in the example below is `18865` will differ on your running instance of this Katacoda scenario.):

`[1] 18865`

**Step 6:** Now, use Kubernetess port-forwarding th expose [Kiali](https://kiali.io/) to the outside world.

`kubectl port-forward -n istio-system --address 0.0.0.0 service/kiali 20001 > /dev/null 2>&1 &`{{execute}}

You'll be presented output similar to the following:

`[2] 18873`

**Step 6:** Finally, use Kubernetess port-forwarding th expose [Grafana](https://grafana.com/) to the outside world.

`kubectl port-forward -n istio-system --address 0.0.0.0 service/grafana 3000 > /dev/null 2>&1 &`{{execute}}

You'll get the following output:


`[3] 18883`

Everything is in place to work with the demonstration API as well as Kiali and Grafana in an external browser window.

----

***Next: Accessing the demonstration API, Kiali and Grafana from an external web browser***