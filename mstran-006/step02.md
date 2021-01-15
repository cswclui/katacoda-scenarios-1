## Objective
The objective of this lesson is to get the demonstration code up and running.

## What You'll Be Doing

In this lesson we're going to bring the demonstration code which is a verion of the *Seat Saver* microservice running under gRPC.

## Steps

**Step 1:** Confirm the working directory for the hybrid MOA of *Seat Saver*.

`clear && cd ~/seat-saver-grpc && pwd`{{execute T1}}

You'get get the following output:

`/root/seat-saver-grpc

**Step 2:** Run the MOA as a `docker-compose` application

`docker-compose up -d`{{execute T1}}

You'll get the following output:

```
Creating seat-saver-grpc_seatsaver_1 ... done
Creating seat-saver-grpc_mongo_1     ... done

```

---

***Next: Exercising the code***