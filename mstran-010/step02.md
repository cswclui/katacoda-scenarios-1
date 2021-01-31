## Objective
The object of this step is to demonstrate how to install the Istio.

## Steps

**Step 1:**  Download and do the initial setup of Istio

`curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.8.0 sh -`{{execute}}

**Step 2:** Add Istio to the system's `$PATH`

`export PATH="$PATH:/root/istio-1.8.0/bin"`{{execute}}

**Step 3:** Use `istioctl` to configure Istio, making it so that 
no calls to external sites can leave the cluster unless egress permission is explicitly set.

`istioctl install --set profile=demo -y --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY`{{execute}}

You'll output similar to the following:

```
Detected that your cluster does not support third party JWT authentication. Falling back to less secure first party JWT. See https://istio.io/v1.8/docs/ops/best-practices/security/#configure-third-party-service-account-tokens for details.
✔ Istio core installed                                                                                                                                               
✔ Istiod installed                                                                                                                                                   
✔ Egress gateways installed                                                                                                                                          
✔ Ingress gateways installed                                                                                                                                         
✔ Installation complete    
```

**Step 4:** Enable Istio namespace access

`kubectl label namespace default istio-injection=enabled`{{execute}}

You will be the following output:

`namespace/default labeled`

**Step 5:** Verify that the Istio services are running in the Kubernetes cluster.

`kubectl get pods -n istio-system`{{execute}}

You'll output similar to the following:

```
NAME                                    READY   STATUS    RESTARTS   AGE
istio-egressgateway-8dff9c778-rn4b8     1/1     Running   0          5m31s
istio-ingressgateway-6cfd75fc57-jrvwj   1/1     Running   0          5m32s
istiod-7f6d7c759-k47n4                  1/1     Running   0          5m44s
```

---

***Next: Setting up an Ingress Rule***