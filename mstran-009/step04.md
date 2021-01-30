## Objective
The objective of this lesson is to query to microservices being monitored by Consul to determine the health of the the array of microservices.

In this lesson you're going to view the array of 3 running microservices in the Consul Dashboard. Then, you will stop one of the microservices. As a result, the Consul Dashboard will report only 2 healthy microservices.


## Steps

**Step 1:** Query the Consul server for information about the microservices running as Docker containers.

`curl $MY_IP:8500/v1/catalog/service/http | json_pp`{{execute}}

You'll get output similar to the following:

```
[
   {
      "Address" : "172.18.0.2",
      "Node" : "myconsul",
      "ServiceEnableTagOverride" : false,
      "ServiceTags" : [],
      "ServiceID" : "http1",
      "ModifyIndex" : 18,
      "ServiceName" : "http",
      "ServiceAddress" : "172.18.0.3",
      "CreateIndex" : 16,
      "ServicePort" : 80
   },
   {
      "Address" : "172.18.0.2",
      "Node" : "myconsul",
      "ServiceEnableTagOverride" : false,
      "ServiceTags" : [],
      "ModifyIndex" : 20,
      "ServiceID" : "http2",
      "ServiceAddress" : "172.18.0.4",
      "ServiceName" : "http",
      "CreateIndex" : 17,
      "ServicePort" : 80
   },
   {
      "Address" : "172.18.0.2",
      "ServiceEnableTagOverride" : false,
      "Node" : "myconsul",
      "ServiceTags" : [],
      "ServiceID" : "http3",
      "ModifyIndex" : 22,
      "ServiceName" : "http",
      "ServiceAddress" : "172.18.0.5",
      "ServicePort" : 80,
      "CreateIndex" : 21
   }
]
```

Notice that Consul is reporting three services running.


**Step 2:** Go the Consul Dashboard by clicking the link below. 

https://[[HOST_SUBDOMAIN]]-8500-[[KATACODA_HOST]].environments.katacoda.com

You'll see the service running along with 3 constituent `nginx` servers.

![Consu Dashboard 01](mstran-009/assets/consul-ui-01.png)


**Step 3:** Shut down one of the `nginx` servers.

`docker stop nginx3`{{execute}}


**Step 4:** Return the to the Consul UI and refresh the web page. Notice that the deleted web server is no longer listed in the Consul Dashboard. This is because the web server no longer passes a health test and is inactive.

![Consu Dashboard 02](mstran-009/assets/consul-ui-02.png)

**Lab Complete!**