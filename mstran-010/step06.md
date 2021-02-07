## Objective

The objective of this step is to get the demonstration API, Kiali and Grafana up an running in web brower windows. Then, to examine the capabilities of the the [Kiali](https://kiali.io/) and [Granfana](https://grafana.com/) Add Ons.

## Steps

**Step 1:** Click the link below to access the demonstration API in an external web browser.

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/

![Demo App](mstran-010/assets/demo-ui.png)

**Step 2:** In a fifth terminal window keep exercising the demonstration API so that Kiali and Grafana has some activity to monitor.

```
while true; do
  curl -s  http://localhost:80 > /dev/null
  echo -n .;
  sleep 0.2
done

```{{execute}}

You get a constant output of dots like so:

`........................................`


**Step 3:** Click the link below to access the Kiali Dashboard in an external web browser.

https://[[HOST_SUBDOMAIN]]-20001-[[KATACODA_HOST]].environments.katacoda.com/

![Kiali](mstran-010/assets/kiali.png)

Browse around the Kiali UI to get a sense of the information that can be gathered.

**Step 4:** Click the link below to access the Grafana Dashboard in an external web browser.

https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/d/vu8e0VWZk/istio-performance-dashboard?orgId=1&refresh=10s

![Grafana](mstran-010/assets/grafana.png)

Browse around the Grafana UI to get a sense of the information that can be gathered.

***Congratulations! You've complete the lab.***