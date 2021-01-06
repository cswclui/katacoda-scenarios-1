## Objective
The objective of this lesson is to get the demonstration code up and running.

## What You'll Be Doing

In this lesson we're going to bring the demonstration code which is a hybrid microservice oriented application (MOA) named *Seat Saver*.

## Steps

**Step 1:** Confirm the working directory for the hybrid MOA of *Seat Saver*.

`clear && cd ~/seat-saver && pwd`{{execute T1}}

You'get get the following output:

`/root/seat-saver`

**Step 2:** Run the MOA as `docker-compose` application

`docker-compose up -d`{{execute T1}}

You'll get the following output:

```
Creating network "seat-saver_seatsaver" with the default driver
Creating seat-saver_seatsaver_1 ... done
Creating seat-saver_redis_1     ... done
Creating seat-saver_mongo_1     ... done

```

**Step 3:** The microservice runs as GraphQL API. We can use the GraphQL Playground that the service publishes to work with the API. Click the link below to bring up the GraphQL Playground in a web browser.


https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

![GraphQL Playground](mstran-005/assets/seat-saver-01.png)

---

***Next: Exercising the code***