## Objective
The objective of this lesson exercise the synchronous version of MOA *Fortune Cookies*.

## What You'll Be Doing

In this secenario you are going to get a list of the current users for the `users` service of the to *Fortune Cookies* MOA.

## Steps

**Step 1:** Find out the IP address of the `Users` service exposed to the network:

`kubectl get services | grep LoadBalancer`{{execute T1}}

You'll get output similar to the following, in this case:

```
users        LoadBalancer   10.110.193.162   10.110.193.162   80:32304/TCP   19m

```
**WHERE**

* `10.110.193.162` in this case, the IP address of the LoadBalancer representing the `users` service that exposes the service running in the Kubernetes cluster (when you run the command, your IP address might be different.)
* `80` is the mapped public port on which the `users` service is listening

**Step 2:** Run a `curl` command against the `users` service by way of the LoadBalancer's IP address>

`curl <LOAD_BALANCER_IP_ADDRESS>:80`

You'll output similar to the following:

```
.
.
[{"firstName":"Humberto","lastName":"West","dob":"1979-01-27","email":"Humberto.West@jackson.com","id":"83efc7f6-9827-43bc-b132-ffa639e3fcf2"},{"firstName":"Bette","lastName":"Collins","dob":"1970-09-11","email":"Bette.Collins@isabelle.net","id":"0958d1b4-feb9-4833-85e1-6d5c9bc735e7"},{"firstName":"Laurine","lastName":"Kirlin","dob":"1970-04-15","email":"Laurine.Kirlin@darrell.com","id":"41931f26-cce5-468e-8178-b5df822fdae8"},{"firstName":"Addie","lastName":"D'Amore","dob":"1979-08-11","email":"Addie.D'Amore@julian.net","id":"c7943df8-73cb-4d7b-9f3d-c7a19446e35f"},{"firstName":"Remington","lastName":"Bechtelar","dob":"1974-09-07","email":"Remington.Bechtelar@wilburn.biz","period":"*/2 * * * * *","id":"33558b78-3677-4288-afaa-8f5de5bf0353"},{"firstName":"Lessie","lastName":"Muller","dob":"1972-04-01","email":"Lessie.Muller@mattie.com","period":"*/2 * * * * *","id":"03712902-1269-4c42-b14c-098adefecf72"},{"firstName":"Gianni","lastName":"O'Conner","dob":"1977-06-03","email":"Gianni.O'Conner@mikel.org","period":"*/2 * * * * *","id":"6aedef14-8c45-4bcb-b6b1-c13c52eaa0e8"},{"firstName":"Eve","lastName":"Farrell","dob":"1968-02-13","email":"Eve.Farrell@maya.info","period":"*/2 * * * * *","id":"f40c5b78-2f78-4c4f-8b56-bb9e23b47755"},{"firstName":"Christine","lastName":"Hodkiewicz","dob":"1989-10-16","email":"Christine.Hodkiewicz@jermey.info","period":"*/2 * * * * *","id":"ec2afe51-4d40-4d05-8c40-8b0ee87822e7"},{"firstName":"Antonio","lastName":"Parker","dob":"1960-01-12","email":"Antonio.Parker@orval.biz","period"
.
.
.
```





---

***Next: Understanding the code***