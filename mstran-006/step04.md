## Objective
The objective of this lesson is to analyze the gRPC implementation of  *Seat Saver* in order to understand how it implements gRPC as an example of a microservice that supports a data schema that is well known to both client and service.

## Steps

**Step 1:** Confirm the working directory for the hybrid MOA of *Seat Saver*.

`clear && cd ~/seat-saver-grpc && pwd`{{execute T1}}

You'get get the following output:

`/root/seat-saver-grpc`

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

As you can see there's a lot of code that goes with this version of *Seat Saver*. The most interesting piece of code to inspect is the `.proto` file that defines the data schema that is used by both the gRPC client and server.

![Basic gRPC](mstran-006/assets/basic-grpc.png)

**Step 3:** Open the file, `seatsaver.proto` in the `vi` editor:

`vi proto/seatsaver.proto`{{execute T1}}

**Step 4:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T1}}

Notice the `seatsaver.proto` has a number of `message` entries. In gRPC parlance, a `message` refers to a data structure. 

The `message` named `Customer` is defined at `Line 8` like so:

```
message Customer {
    string firstName = 1;
    string lastName = 2;
    string email = 3;
    string created = 4;
    string message = 5;
}

```
Notice that `Customer` has the fields,`firstName`, `lastName`, `email`, `create` and `message`. Thes are fields of type, `string`.

The `message` named `Seat` is defined at `Line 26` like so:

```
message Seat {
    string id = 1;
    string number = 2;
    string section = 3;
    Status status = 4;
    string changed = 5;
    string created = 6;
    Customer customer = 7;
    string message = 8;
}
```

Notice above that `Seat` has a field, `customer` at `Line 33`. The field, `customer` is of type, `Customer`. Thus, you can see that gRPC supports the notion of using complex types as field values.

Notice that the `message` named `Venue` is defined at `Line 38` like so:

```
message Venue {
    string id = 1;
    string name = 2;
    string address = 3;
    string city = 4;
    string state_province = 5;
    string postal_code = 6;
    string country = 7;
    string changed = 8;
    string created = 9;
    repeated Seat seats = 10;
    string message = 11;
}
```

You can see at `Line 48` that Venue declares a field named, `seats` that is declared as `repeated Seat`. This is the gRPC way of declaring an array of `Seat` objects.

**Step 5:** Go to `Line 88` to see how functions are declared.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

`:88`{{execute T1}}

You'll see the following code:

```
service SeatSaverService {
    rpc GetVenues(Authentication) returns (stream Venue) {}
    rpc GetVenue(VenueRequest) returns (Venue) {}
    rpc GetOpenSeats(VenueRequest) returns (stream Seat) {}
    rpc GetSoldSeats(VenueRequest) returns (stream Seat) {}
    rpc GetReservedSeats(VenueRequest) returns (stream Seat) {}
    rpc GetSeats(VenueRequest) returns (stream Seat) {}
    rpc ReserveSeat(SeatStatusRequest) returns (Seat) {}
    rpc ReleaseSeat(SeatStatusRequest) returns (Seat) {}
    rpc BuySeat(SeatStatusRequest) returns (Seat) {}
    rpc Ping(PingRequest) returns (PingResponse) {}
    rpc PingStream(PingRequest) returns (stream PingResponse) {}
}

```
The methods of the gRPC API are declared between `Lines 88 - 100`. Under gRPC a method is declared using the `rpc` keyword. You can see the function names are declared, along with parameter objects that are to be passed as well as return types using the `returns` keyword. When a method return has the keyword, `stream`, this means that the data is returned as a continuous stream, as shown at the `GetOpenSeats` method defined  above at `Line 91`.

**Step 6:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 7:** Exit `vi`

`:q!`{{execute T1}}

## Summary

The important thing to understand about using gRPC for your microservice is that the `.proto` [language specification](https://developers.google.com/protocol-buffers/docs/proto3) allows developers to implement gRPC APIs in any language for which there are implementation libraries. This *Seat Saver* version of gRPC is implemented in Node.js. However, it just as easily could have been implemented in [Go](https://grpc.io/docs/languages/go/quickstart/), [C++](https://grpc.io/docs/languages/cpp/quickstart/), [Java](https://grpc.io/docs/languages/java/quickstart/), [Python](https://grpc.io/docs/languages/python/quickstart/), [Ruby](https://grpc.io/docs/languages/ruby/) or [C#](https://grpc.io/docs/languages/csharp/quickstart/).

gRPC is a compelling way to implement an API, and subsequently a microservice, because of the streaming capabilities it provides "out of the box."

The notion of polygot development is an important principle of microservice design. You can have a variety to teams expert in a variety or programming languages implement gRPC microservices in the way  that is easist for the particular team. Yet, because the gRPC `.proto` specification is standardized, any microservice can interact with any other microservice regardless of the underlying programming langauge ***as long as the schemas defined in the microservices's `.proto` file are accesible to all interested parties.***

Also, an added benefit of gRPC is that its intended to be very fast.

However there is are two tradeoffs to gRPC. First, it is a complex technology to implement. Second, it uses HTTP/2 and while most modern web browsers support HTTP/2 streaming, most of the web-page based internet still operates under HTTP/1.1. [Many mission critical implementations](https://www.programmableweb.com/news/how-ablyio-uses-grpc-apis-to-streamline-its-messaging-service/analysis/2020/10/29) of gRPC are on the server side internally or on the cloud between servers that support HTTP/2.2.

---

**Congratuations!** You've completed the lab.