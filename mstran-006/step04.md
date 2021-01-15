## Objective
The objective of this lesson is to analyze the demonstration service, *Seat Saver* in order to understand how it implements gRPC as an example of a microservice that supports a data schema that is well known to both client and service.

## Steps

**Step 1:** Confirm the working directory for the hybrid MOA of *Seat Saver*.

`clear && cd ~/seat-saver-grpc && pwd`{{execute T1}}

You'get get the following output:

`/root/seat-saver-grpc

**Step 2:** Take a look at the files and directories of the gRPC version of *Seat Saver*:

`tree -L 1`{{execute T1}}

You'll get the following output:

```
.
├── dataManager
├── dataSeeding
├── docker-compose.yaml
├── Dockerfile
├── helpers
├── images
├── index.js
├── LICENSE
├── messageBroker
├── package.json
├── proto
├── README.md
├── test
└── validation

```

As you can see there's a lot of code that goes with this version of *Seat Saver*. The most interesting place to start is to look at the `.proto` file that defines the data schema that is used by both the gRPC client and server.

**Step 3:** Open the file, `seatsaver.proto` in the `vi` editor:

`vi proto/seatsaver.proto`{{execute T1}}

**Step 4:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T1}}

---

**Congratuations!** You've completed the lab.