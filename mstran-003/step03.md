## Objective
The objective of this lesson exercise the synchronous version of MOA *Fortune Cookies*.

## What You'll Be Doing

In this secenario you are going to add a new user to *Fortune Cookies* MOA and then verify that the fortunes are being emitted to the new user according to the user information sent to *Fortune Cookies*.

## Steps

**Step 1:** Find out the IP address of the `Users` service exposed to the network:

`kubectl get services | grep LoadBalancer`{{execute T1}}

You'll get output similar to the following, in this case:

```
users        LoadBalancer   10.110.193.162   10.110.193.162   80:32304/TCP   19m

```
**WHERE**

* `10.110.193.162` in this case, the IP address of the LoadBalancer representing the `users` service that exposes the service running in the Kubernetes cluster (when you run the command, you're IP address might be different.)
* `80` is the mapped public port on which the `users` service is listening

**Step 2:** Run a `curl` command against the `users` service by way of the LoadBalancer's IP address>

`curl <LOAD_BALANCER_IP_ADDRESS>:80`

You'll output similar to the following:

**Step 3:**  Add a new user (make sure you provide the correct IP address for the LoadBalancer. You discovered the IP address above in Step 1.

`curl -X POST 'http://<LOAD_BALANCER_IP_ADDRESS>:80/' -H 'Accept-Encoding: gzip, deflate, br' -H 'Content-Type: application/json' -H 'Accept: application/json' -H 'Connection: keep-alive' -H 'DNT: 1' -H 'Origin: http://localhost:3000' --data '{"firstName":"Cool", "lastName":"McCool", "dob":"1979-01-27", "email":"cool.mccool@reallycool.com"}'

You'll get the following output:

```
TBD

```

**Step 4:** Query the *Fortune Cookie* logs for the new user




---

***Next: Understanding the code***