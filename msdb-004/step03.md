## Objective
The objective of this lesson is analyze the demonstration application to learn how it supports the [Command Query Responsibility Segregation ](https://en.wikipedia.org/wiki/Command%E2%80%93query_separation) (CQRS) pattern in an [event-driven architecture](https://en.wikipedia.org/wiki/Event-driven_architecture).

## What You'll Be Doing

In the previous lesson we demonstrated a simple implementation of the CQRS in which new data was added to both the `write` and `read` data sources from within the handler code of the HTTP `POST` request. This approach had two significant shortcomings. First, it's a violation of the concept of [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns). Second, it makes the code hard to refactor.

In this lesson we're going to take another approach. Instead of adding new data to both the `write` and `read` data sources in sequence with in the scope of a single function, we're going to implement an event driven design.

Part of this design implementation is to introduce a new component in the form of a TypeScript class named, `Mediator`. The `Mediator` does the work of coordinating the work of adding new data to both the `write` and `read` data sources. The `Mediator` will add data to the `write` datasource directly. Then, the `Mediator` will publish a message to the message broker. (The messsage broker is part of the this version of the `Order` microservice.) The message will have data that is associated with an event named, `OnNewOrder`. The `read` data source is subscribed to the message broker to receive `OnNewOrder` messages.

![Event Driven Architecture](msdb-004/assets/CQRS-basic-mediator.png)

When the component managing the `read` data source receives an `OnNewOrder` message it adds the data in that message to its underlying instance of `MongoDB`.

The benefit of taking an even-driven approach to adding data to the `read` data source is that the process is loosely coupled. The activities of the `read` data source are completely separate from all other activity. Also, the `read` activity is asynchronous. This means that new data will be added to the `read` data source independently, without blocking activity in the parent microservice.
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
* `broker` is the directory that contains the TypeScript class, `MessageBroker` that manages publishing and subscribing to the [Kafka](https://kafka.apache.org/) message broker backing service
* `interfaces` is the directory that contains the interfaces that describe the structure of data coming into the microservice
* `mediator` is the directory that contains the TypeScript class, `Mediator`. The purpose of `Mediator` is to coordinate writing to both the `write` and `read` data sources as well as reading data from the `read` data sources.
* `read_db` is the directory that contains the data models and classes to implement data access for the microservice's `read` data source.
*  `write_db` is the directory that contains the data models and classes to implement data access for the microservice's `write` data source.

Let's take a look at the webserver code in `app.ts`.

**Step 3:** Open `app.ts` in the `vi` editor

`vi app.ts`{{execute T2}}

**Step 4:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

and then enter:

`:set number`{{execute T2}}

Now, let's go the code that accepts and processes a `POST` request.

**Step 5:** Go down to `Line 55`.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:55`{{execute T2}}

`Lines 55 - 59` contains the code that accepts and processes a `POST` request. The purpose of the `POST` request is add data to the microservice.

**Step 6:** Take a look at `Line 57`;

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:57`{{execute T2}}

Notice the statement at `Line 57`:

```
const id: string = await mediator.setOrder(orderInput);

```

The statement shown above uses an instance of the `Mediator` class to add `order` information to the microservice. Using the `Mediator` class is a clear and appropriate separation of concerns. **Remember**, the purpose of the web server is to accept a `request` and send a `response`. The purpose of the `Mediator` class is to coordinate `write` and `read` behavior according to the CQRS pattern.

Let's get out of the file, `app.ts` and take a look at the method, `Mediator.setOrder(orderInput)`.

**Step 7:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:q!`{{execute  T2}}

You have exited `vi`.


**Step 8:** Open the file `mediator/Mediator.ts` in the `vi` editor

`vi mediator/Mediator.ts`{{execute  T2}}

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

and then enter:

`:set number`{{execute T2}}

The code for the method `Meditator.setOrder(inputOrder)` is at `Lines 42-60`. The first line of code to examine is at `Lines 44`, so lets go there.

**Step 9:** Take a look at the code at `Line 44`;

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:44`{{execute T2}}

Notice the statement at `Line 44`:

```
const result: Order  = await this.writeDataManager.setOrder(order);

```

This is where the data is added to the `write` data source using the `writeDataManager`. Once the data is added to the `write` data source, it needs to be added to the `read` data source. Thus, `Mediator` will send a message to the `OnNewOrder` topic of the message broker. The assumption is that the `read` data source is subscribed to to the topic `OnNewOrder` and will receive messages published to that topic.

The code that does the work of publishing to the message broker is located at `Line 58`, so let's to there.

**Step 10:** Take a look at the code at `Line 58`;

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:58`{{execute T2}}

Notice the line of code at `Line 58`:

```
await this.messageBroker.publish(event, topic);

```

**WHERE:**

* `event` is the message to be sent to the message broker. The message is defined at `Lines 48-55`.
* `topic` is the name of topic on the message broker to which the message will be published. The topic name is returned by a call to `getOnNewOrderTopicSync()` at `Line 62`.

The code at `Line 58` does the work of publishing a message that describes the new `Order` data to the topic, `OnNewOrder` in message broker. 

At this point we've used `Mediator.setOrder(inputOrder)` to add incoming `order` data to the `write` data source and send a message to parties interested in and subscribed to the topic `OnNewOrder`. The last piece of th puzzle is to see how the message is consumed by the microservice. This work is done by the class `ReadDataManager`. The `ReadDataManager` encapsulates `write` and `read` activities to the `read` data source. It also subscribes to the topic named, `OnNewOrder` on the message broker.

Let's exit `vi` to get out of the file, `mediator/Mediator.ts` and then take a look at `ReadDataManager`.

**Step 11:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:q!`{{execute  T2}}

You have exited `vi`.


**Step 12:** Open the file `read_db/ReadDataManager.ts` in the `vi` editor

`vi read_db/ReadDataManager.ts`{{execute  T2}}

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

and then enter:

`:set number`{{execute T2}}

**Step 13:** Take a look at the constructor for the class, `ReadDataManager`. The [constructor](https://www.typescriptlang.org/docs/handbook/type-checking-javascript-files.html#constructor-functions-are-equivalent-to-classes) is at `Line 15`. 

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:15`{{execute T2}}

Notice at `Line 17` that `ReadDataManager` uses the `messageBroker` to subscribe to the topic of interest, in this case the topic is, `OnNewOrder`.

The behavior that `ReadDataManager` will execute upon receiving the message is defined by the method, `this.handler`. (Both `messageBroker` and `handler` are injected into the `Mediator` class as option values that are passed to the constructor by way of the `option` parameter object.)

Let's take a look at the code for `this.handler` which executes at `Lines 71-105`.

**Step 14:** Take a look at the method `this.handler`. 

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:71`{{execute T2}}

Notice that the method, `handler` has a internal method, `addOrder()`. 

The `addOrder()` function adds data to two collections (`Order` and `Customer`) in the underlying `MongoDB` document database. It's adds `order` data to the `Order` collection at `Line 80`.

**Step 15:** Go to `Line 87` in the `vi` editor.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:87`{{execute T2}}

Also, `addOrder()` uses a MongoDB method, `findOneAndUpdate()` at `Line 87` to see if the `customer` already exists in the `Customer` collection. If the `customer` does not exist, it's added to the `Customer` collection. (Doing an "upsert" automatically is behavior provided by the MongoDB method, `findOneAndUpdate()`.)

**Step 16:** Go to `Line 104` in the `vi` editor.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:104`{{execute T2}}

Again, the function `addOrder())` is internal to the function, `handler`. `addOrder()` is not called until the `handler` function is called, and only if the incoming `event.topic` has the value, `OnNewOrder` as shown at `Line 91`. If indeed, `event.topic === "OnNewOrder"` then statement, `await addOrder(input)` is executed at `Line 104`.

Now that you've examined how the `Mediator` works with the `ReadDataManager` to add `order` information to the microservice, we can close the `vi` editor.

**Step 17:** Close the `vi` editor.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:q!`{{execute  T2}}

You have exited `vi`.

## Summary

This lesson gave you a sense of how the code is organized to support CQRS using an event-driven architecture. You saw that the `Mediator` class worked with the `WriteDataManager` to add data to the `write` data source directly. Also, `Mediator` sent a message to the `OnNewOrder` topic on the message broker. Sending the message informed interested parties that a new `Order` is added to the microservice. The `read` data source is subscribed to the topic `OnNewOrder` and thus, is implicitly interested in the message. When the `ReadDataManager` received the message, it added the new `Order` information to the MongoDB document database that is the backing service that is encapsulated within the `ReadDataManager`.

This is essentially how an event-driven approach to data management works. In the next lesson you'll look at the actual data sources involved in the pattern.

---

***Next: Viewing the data***