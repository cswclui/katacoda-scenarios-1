## Objective
The objective of this lesson is to define an Ingress rule that will allow general access into the Kubernetes cluster the Istio Gateway.

## Steps

**Step 1:** Install the demonstration deployment

`kubectl apply -f /root/deployments.yaml`{{execute}}

You will get the following output:

```
deployment.apps/frontend-prod created
deployment.apps/business-prod created
```

**Step 2:** Install the Kubernetes services that bind to the Kubernetes deployment

`kubectl apply -f /root/services.yaml`{{execute}}

You'll get the following output:

```
service/frontend created
service/business created
```

**Step 3:** Get the external Istio Gateway IP address: 

`kubectl get svc -n istio-system`{{execute}}

You'll get out put similar to the following:

```
NAME                   TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)                                                                      AGE
istio-egressgateway    ClusterIP      10.96.13.48    <none>         80/TCP,443/TCP,15443/TCP                                                     6m55s
istio-ingressgateway   LoadBalancer   10.96.40.202   172.19.255.2   15021:32586/TCP,80:32577/TCP,443:30628/TCP,31400:30835/TCP,15443:30143/TCP   6m54s
istiod                 ClusterIP      10.96.175.26   <none>         15010/TCP,15012/TCP,443/TCP,15014/TCP                                        7m7s
```

**Step 4:** Assign the Istio Gateway IP address to an environment variable. Get the value of `EXTERNAL-IP` assigned to the service, `istio-ingressgateway` and assign it to the environment variable, `ISTIO_GTWY_IP`.

`export ISTIO_GTWY_IP=<Istio Gateway IP address>`

For example:

`export ISTIO_GTWY_IP=172.19.255.2`

**Step 5:** Confirm the environment variable value

`echo $ISTIO_GTWY_IP`{{execute}}

You'll get output similar to the following, but your value might be different:

`172.19.255.2`

**Step 6:** Try to access the service

`curl $ISTIO_GTWY_IP`{{execute}}

You'll get an error.

`curl: (7) Failed to connect to 172.19.255.2 port 80: Connection refused`

Notice you can't get outside the cluster

Why? Because there is no Ingress rule that permits entry into the cluster. So, let's add an Ingress rule.

**Step 7:** Apply the Ingress rule

`kubectl apply -f /root/ingress.yaml`{{execute}}

You'll get the following output:

```
gateway.networking.istio.io/my-gateway created
virtualservice.networking.istio.io/frontend created
```

**Step 8:** Try to access the service agin

`curl $ISTIO_GTWY_IP`{{execute}}

You'll get access into the cluster

```
frontend-prod - 0.16secs
http://business/ -> business-prod - 0.06secs
http://worldclockapi.com/api/json/utc/now -> StatusCodeError: 502 - ""

```

But, notice when the code tries to get outside of the Kuberenetes cluster to, `http://worldclockapi.com/api/json/utc/now`, the egress is denied.

Why? Because there is no egress rule allowing access to that domain. In the next lesson you'll create one.

---

***Next: Creating an Egress Rule***