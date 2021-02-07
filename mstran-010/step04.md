## Objective
The objective of this lesson is to demonstrate how to create an Istio egress rule that allows a given service to call URLs that are outside of the cluster.

## Steps

**Step 1:** Verify that the environment variable, `$GATEWAY_URL` is set to the IP address of the Istio Gateway. Clear the screen in the spirit of good housekeeping.

`clear`{{execute}}

Verify the value of `$GATEWAY_URL`:

`echo $GATEWAY_URL`{{execute}}

You'll get output similar to the following, but your instance might be different:

`172.19.255.2:80`

**Step 2:** Verify that the demonstration application is denied access to URLs that are outside of the Kubernetes cluster.

`curl $GATEWAY_URL`{{execute}}

You'll get the following output:

```
frontend-prod - 0.028secs
http://business/ -> business-prod - 0.018secs
http://worldclockapi.com/api/json/utc/now -> StatusCodeError: 502 - ""
```

This line:

`http://worldclockapi.com/api/json/utc/now -> StatusCodeError: 502 - ""`

is the indicator the access to the external URL isa denied.

**Step 3:** Apply the Istio Egress rule using a Kubernetes manifestyg file that automatically added to the Katacoda interactive learning environment at the start of the scenario.

`kubectl apply -f /root/egress.yaml`{{execute}}

You'll get the following output:

`serviceentry.networking.istio.io/jsontime created`

**Step 4:** Run the `curl` command again.

`curl $GATEWAY_URL`{{execute}}

Notice you **can** get outside the cluster

```
frontend-prod - 0.229secs
http://business/ -> business-prod - 0.219secs
http://worldclockapi.com/api/json/utc/now -> {"$id":"1","currentDateTime":"2021-01-31T19:54Z","utcOffset":"00:00:00","isDayLightSavingsTime":false,"dayOfTheWeek":"Sunday","timeZoneName":"UTC","currentFileTime":132565964503231512,"ordinalDate":"2021-31","serviceResponse":null}$ 

```

The line below is the indicator that the code is allowed to call URLs outside the cluster. 

```
http://worldclockapi.com/api/json/utc/now -> {"$id":"1","currentDateTime":"2021-01-31T19:54Z","utcOffset":"00:00:00","isDayLightSavingsTime":false,"dayOfTheWeek":"Sunday","timeZoneName":"UTC","currentFileTime":132565964503231512,"ordinalDate":"2021-31","serviceResponse":null}
```

Notice that the code is calling `http://worldclockapi.com/api/json/utc/now`. Before the egress rule was in force, such acceess was denied. As you can see, the egress rule is now in force.

----

***Next: Working setting up Katacoda to work with the Istio add-ons in an external web browser.***


