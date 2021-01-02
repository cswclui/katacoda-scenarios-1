## Objective
The objective of this lesson is analyze the demonstration application to learn how it supports the [Command Query Responsibility Segregation ](https://en.wikipedia.org/wiki/Command%E2%80%93query_separation) (CQRS) pattern in an [event-driven architecture](https://en.wikipedia.org/wiki/Event-driven_architecture).

## What You'll Be Doing

In the previous lesson we demonstrated a simple implementation of the CQRS in which new data was added to both the `write` and `read` data sources from within the handler code of the HTTP `POST` request. This approach had two significant shortcomings. First, it's violation of the concept of [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns). Second, it makes the code hard to refactor.

In this lesson we're going to take another approach. Instead of adding new data to both the `write` and `read` data sources in sequence with in the scope of a single function, we're going to implement an event driven design.

Part of this design implementation is to introduce a new component in the form of a TypeScript class named, `Mediator`. The `Mediator` does the work of coordinating the works of adding new data to both the `write` and `read` data sources. The `Mediator` will add data to the `write` datasource directly. Then, the `Mediator` will publish a message to the message broker which is part of the this version of the `Order` microservice. The message will have data that is associated with an event named, `OnNewOrder`. The `read` data source is subscribed to the message broker to receive `OnNewOrder` messages.

When the component managing the `read` data source receives an `OnNewOrder` message it adds the data in that message to the `read` data source.

The benefit of taking an even-driven approach to adding data to the `read` data source is that the process is loosely coupled. The activities of the `read` data source is completely separate from all other activity. Also, the `read` activity is asynchronous. This means that new data will be added to the `read` data source independently, without blocking activity in the parent microservice.
## Steps

**Step 1:** Go the TypeScript source code working directory:

`clear && cd ~/simplecqrs/src/`{{execute T2}}

**Step 2:** Take a look at the files and directories in the source code's working directory:

`tree ./ -L 1`{{execute T2}}

You'll get the following output:

```
./
├── app.ts
├── broker
├── interfaces
├── mediator
├── read_db
└── write_db

```

**WHERE**

* `app.ts` is the code for the web server that powers the microservice's API
* `broker` is the directory that contains the TypeScript class that manages publishing and subscribing to the Kafka message broker backing services
* `interfaces` is the directory that contains the interfaces that describe the structure of data coming into the microservice
* `mediator` is the directory that contains the TypeScript class, `Mediator`
* `read_db` is the directory that contains the data models and classes to implement data access for the microservices `read` data source.
*  `write_db` is the directory that contains the data models and classes to implement data access for the microservices `write` data source.

Let's take a look at the webserver code in `app.ts`.

**Step 3:** Open `app.ts` in the `vi` editor

`vi app.ts`{{execute T2}}

**Step 4:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

and then enter:

`:set number`{{execute T2}}

**Step 5:** Go down to `Line 60`.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:60`{{execute T2}}



This lesson gave you a sense of how the code is organized to support CQRS using an event-driven architecture. In the next lesson you'll look at the actual data sources involved in the pattern.

---

***Next: Viewing the data***