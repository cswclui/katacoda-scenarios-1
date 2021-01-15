## Objective
The objective of this lesson exercise the synchronous version of MOA *Fortune Cookies*.

## Steps

First, we need to install a gRPC client.

**Step 1:** Install the build tools we'll need to create the gRPC client under the Go programming language:

`go get -v github.com/fullstorydev/grpcurl/...`{{execute T1}}

`go install github.com/fullstorydev/grpcurl/cmd/grpcurl`{{execute T1}}

Next, we need to get an understanding of the the gRPC API.

**Step 2:** Confirm the working directory

`clear && cd ~/seat-saver-grpc && pwd`{{execute T1}}

**Step 3:** Get a list of services

`grpcurl -import-path ./proto -proto seatsaver.proto list`{{execute T1}}

You'll get output as follows:

`seatsaver.SeatSaverService`

While is is possible for a gRPC API to publish multiple services, *Seat Saver* publishes only one service, `SeatSaverService`.

**Step 4:** Describe the a remote procedure, `seatsaver.SeatSaverService.GetVenues`. This is the gRPC method that gets a list of all the venues in the API.

`grpcurl -import-path ./proto -proto seatsaver.proto describe seatsaver.SeatSaverService.GetVenues`{{execute T1}}

You'll get output as follows:

```
seatsaver.SeatSaverService.GetVenues is a method:
rpc GetVenues ( .seatsaver.Authentication ) returns ( stream .seatsaver.Venue );

```

**Step 5:**  Execute a method, `GetVenues`:

`grpcurl -plaintext -import-path ./proto -proto seatsaver.proto localhost:50051 seatsaver.SeatSaverService/GetVenues`{{execute T1}}

You'll get output similar to the snippet shown below:

```
[
.
.
 {
      "id": "5ff64b9c974f78a11c468e7e",
      "number": "U2",
      "section": "Section-U",
      "status": "OPEN",
      "changed": "Wed Jan 06 2021 23:45:32 GMT+0000 (Coordinated Universal Time)",
      "created": "Wed Jan 06 2021 23:45:32 GMT+0000 (Coordinated Universal Time)"
    },
    {
      "id": "5ff64b9c974f7876d9468e7f",
      "number": "U3",
      "section": "Section-U",
      "status": "OPEN",
      "changed": "Wed Jan 06 2021 23:45:32 GMT+0000 (Coordinated Universal Time)",
      "created": "Wed Jan 06 2021 23:45:32 GMT+0000 (Coordinated Universal Time)"
    }
.
.
.
]
```

These are the venues published by the *Seat Saver* API. There are other methods in the API. These other methods can be discovered by inspected the `.proto` file that describes the gRPC schema. This `.proto` file is used by both the gRPC client and gRPC server.

We'll analyze the `.proto` file in the next lesson.
---

***Next: Understanding the code***