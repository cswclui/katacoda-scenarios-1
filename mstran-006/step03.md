## Objective
The objective of this lesson exercise the synchronous version of MOA *Fortune Cookies*.

## Steps

First, we need to install a gRPC client.

**Step 1:** Install the build tools

`go get github.com/fullstorydev/grpcurl/... -v`{{execute T1}}

`go install github.com/fullstorydev/grpcurl/cmd/grpcurl`{{execute T1}}

Next, we need to get an understanding of the the gRPC API.

**Step 2:** Confirm the working directory

`clear && cd ~/seat-saver-grpc && pwd`{{execute T1}}

**Step 3:** Get a list of services

`grpcurl -import-path ./proto -proto seatsaver.proto list`{{execute T1}}

**Step 4:** Describe the a remote procedure

`grpcurl -import-path ./proto -proto seatsaver.proto describe seatsaver.SeatSaverService.GetVenues`{{execute T1}}

**Step 5:**  Execute a method

`grpcurl -plaintext -import-path ./proto -proto seatsaver.proto localhost:50051 seatsaver.SeatSaverService/GetVenues`{{execute T1}}

Shutdown the log stream

`echo "Ctrl+C"`{{execute interrupt T3}}



---

***Next: Understanding the code***