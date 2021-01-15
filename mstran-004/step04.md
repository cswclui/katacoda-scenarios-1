## Objective
The objective of this lesson is to analyze the asynchronous version *Fortune Cookies* to learn how  it implements an event driven microservice architecture.

![Basic Architecture](mstran-004/assets/basic-architecture-components.png)

## Steps

**Step 1:** Go to the working directory for the monolithic verison of *Fortune Cookies*:

`clear && cd ~/fortune-cookies/microservice-async && pwd`{{execute T1}}

You'get get the following output:

`/root/fortune-cookies/microservice-async`
---

**Step 2:** Take a look at the file and directory structure of the asynchronous version of *Fortune Cookies*:

`tree -L 1`{{execute T1}}

You'll get the following output:

```
.
├── architecture.md
├── docker-seed.sh
├── fortunes
├── images
├── kubernetes
├── message-gen
├── pingrx
├── readme.md
├── scheduler
├── sender
└── users

```

The relevant directories to the operation of *Fortune Cookies* are:

* `fortunes`
* `scheduler`
* `sender`
* `users`

These directories contains the source code for the microservices that are part of the *Fortune Cookies* microservices oriented application (MOA).

The important thing to understand at this point is that all communictation between these services take place between messages that are sent and received from a message broker. In this case the message broker used in Redis. However, at the conceptual level, any broker can be used.

![logo](mstran-004/assets/block-async.png)

The benefit of using an asynchronous architecture is that all services a loosely coupled. In terms of *Fortune Cookies* no microservice has any direct knowledge or dependency on another microservice. All a given microservice really "knows" in the location of the message broker on the network, and this location is defined by a DNS name provided by the Kubernetes container orchestration technology. IP addresses are completely opaque to the microservice. Also, a microservice knows the format and schema of the message that it's  publishing. If a microservice is consuming a message, in that case, it also knows the format and schema of the incoming message.

How a microservice behaves when consuming a message from a topic to which it is subscribed is the concern of that microservice only. Publishers don't know what comsumers are doing. Consumers don't know what publishers are doing nor do the consumers know when the activities of other microservices are taking place.

The boundaries of a microservice are well defined.

Let's take a look at a concrete example.

**Step 3:** Open the source code for the microservice:

`vi scheduler/index.js`{{execute T1}}

**Step 4:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T1}}

Notice at `Lines 4 - 30` the developer left a comment that describes the format of the incoming and outgoing messages relevant to `scheduler`. This is useful information that was done as a matter of convenience.

**Step 5:** Go to `Line 35`

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

`:35`{{execute T1}}

You'll see the following code at `Lines 35 - 45`:

```
const onMessageReceived = async (channel, message) => {
    const msg = JSON.stringify(message);
    console.log(`[RECEIVED MESSAGE], ${msg} at ${new Date()}`);

    console.log(`Adding message ${msg} message, from, ${channel} at ${new Date()}.`);
    const res = await addScheduleItem(message);
    console.log(`Added message ${msg} from, ${channel} at ${new Date()} with response ${res}`);
};
const channel = getDependencyEnvVar('SCHEDULER_SOURCE_TOPIC');
const subscriber = new Subscriber(channel, onMessageReceived);
console.log(` Subscriber ${subscriber.id} is listening on channel, ${channel} at ${new Date()}.`);

```

The function, `onMessageReceived()` is a function that is called when a message comes into `scheduler`. Most of the code does "before" and "after" logging activity. However, as you can see at `Line 40`, the function calls `addScheduleItem(message)` passing the `message` that was originally passed into `onMessageReceived()`. This function, `onMessageReceived()` is passed a parameger to a `subscriber` object that is created at `Line 44`.

(The details of publishing and subscribing to messages are implemented in a custom made Node.js module that ships with `scheduler`. You can  view the code for the custom module [here](https://github.com/reselbob/fortune-cookies/blob/master/microservice-async/scheduler/messageBroker/index.js).)

What's happening operationally is that when the file, `index.js` for `scheduler` is loaded into memory, a `subscriber` is created and that `subscriber` is given the behavior in the function, `onMessageReceived()` to execute when  message is received. `scheduler` then listens to the message broker for incoming messages.

The file, `index.js` is called automatically by the Kubernetes container orchestration framework when the `scheduler` pod is created.

**Step 6:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 7:** Exit `vi`

`:q!`{{execute T1}}

You have exited `vi`.

The question then becomes, what is happening in `addScheduleItem()`? After all, `addScheduleItem()` is the place from where a `fortune cookie` is sent.

Let's take a look at that code.

**Step 8:** Open source code for the `dataManager` in `scheduler`.

`vi scheduler/dataManager/index.js`{{execute T1}}

**Step 9:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T1}}

**Step 10:** Go to `Line 29`, the location of the function, `postToSender`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

`:29`{{execute T1}}

You'll see the following code:

```

const postToSender = async (scheduleItem) => {
    scheduleItem.sendDate = new Date();
    const topic = getDependencyEnvVar('SCHEDULER_TARGET_TOPIC');
    const publisher = new Publisher(topic);
    const msg = JSON.stringify(scheduleItem);
    console.log(`[SCHEDULER] is using Publisher ${publisher.id} to publish message, ${msg} at ${new Date()}`);
    const res = await publisher.publish(msg);
    console.log(`[SCHEDULER] is used Publisher ${publisher.id} and published message, ${msg} at ${new Date()} with response ${res}.`);
};

```

This code is used by the particular CronJob that is created in `Scheduler` according to each user. The CronJob executes at a set interval of time according to the user's configuration. When the CronJob executes it publishes a message to the message broker. That publishing behavior is described above in the function, `postToSender()`.

`postToSender()` creates a message at `Line 33` and then at `Line 35` publishes the message to the message broker with the statement:

`const res = await publisher.publish(msg);`

`Scheduler` has no idea which microservice is listening for the message it publishes. It's only job is to receive messages relevant to creating a `scheduleItem` and then within the work of creating a `scheduleItem`, inject code in the CronJob's constructore that publishs messages out to predefined topic that is relevant for those microservices interested in receiving message about sending behavior. 

Publishing and receiving messages in an encapsulated manner that is particular the purpose of a microservice is the essential principle that drives an event-driven microservice architecture. 

**Step 11:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 12:** Exit `vi`

`:q!`{{execute T1}}

You have exited `vi`.

## Summary

Using messages to faciliate inter-service communication is used extensively in this asynchronous version of *Fortune Cookes*. You can view the functions, `onSenderMessageReceived` and `onFortunesMessageReceived` in the [`sender`](https://github.com/reselbob/fortune-cookies/blob/master/microservice-async/sender/index.js) microservice to see more examples. The functions, `onMessageReceived` in the microservice, [`fortunes`](https://github.com/reselbob/fortune-cookies/blob/master/microservice-async/fortunes/index.js) and `onUserMessageReceived` in the [`users`](https://github.com/reselbob/fortune-cookies/tree/master/microservice-async/users) microservice are also examples.

The important thing to understand about using an event-driven architecture to faciliate communication among microservices is that it provides a great deal of operational independence and flexiblity. Scaling microservice up and down gets easier, particularly if you are using a container orchectration technology such as Kubernetes.

But, as with an benefit, there is a trade-off. Programming and testing microservices in an asynchronous, event-driven architecture is a lot more complex. There are always a lot of "balls in the air" to manage. But, the ability to scale faster and more easily make the tradeoff worth it in the right circumstance.

**Congratuations!** You've completed the lab.