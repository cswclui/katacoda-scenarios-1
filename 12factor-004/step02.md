## Objective
The objective of this lesson is to develop an understanding of the benefit of using the [Backing Services](https://12factor.net/backing-services) principle of 12 Factor App in order to make an application flexible, scalable and easier to change.

In this lab we're going to evolve the lab's demonstration application to learn how to delegate data storage to an external resource. Using data storage as a backing service is typical in the 12 Factor App.

## Key Concept: 12 Factor App - Back Services
A key concept in the **Backing Services** principle of 12 Factor App is that crtical, but fundamentally independent logic should be part of the application's source code. For example, imagine that you are logging incoming HTTP requests to a file in the hosting machine's file system. At some point the risk that the log files will eat up capacity is real. Or, if the machine fails for some reason. Then the log data is lost.

Now granted there are a lot of precautionary measures you can take to prevent such hazard on the file system, but by using the principle of Backing Server can have log data to to an external resource. The external resource might be another file server on the network or even a database. But, the important things is that the identified resource will be designed in such as way as to absorb a near infinite amount of log data. This way your application is doing what it's designed to do and log management, which is not really the intention of your service, is delegated elsewhere.

Also, an intrinsic concept in Backing Service is tranportability. In other words, you should program your service so that you can easily disconntect fron one backing service and bind to an alternate on demand one. (We'll cover this concept in depth throughout the scenario.)


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

**Step 2:** Check out the an earlier version of *Pinger* from the local `git` repo that we've just cloned from GitHub

`git checkout 4-backing-services.0.0.1`{{execute}}

You'll see output as follows:

```
Branch '4-backing-services.0.0.1' set up to track remote branch '4-backing-services.0.0.1' from 'origin'.
Switched to a new branch '4-backing-services.0.0.1'

```
**Step 3:** Take a look at the contents of the demonstration application's working directory.

`clear && tree -L 2`{{execute}}

You'll see output as follows:

```
.
├── collector
│   ├── datastore
│   ├── index.js
│   ├── package.json
│   └── test
└── pinger
    ├── logger
    ├── package.json
    ├── readme.md
    ├── server.js
    └── test

```

Notice that this branch of the source introduces an application named `collector` in addition to the demonstration application `pinger` that we've been working with in previous lessons.

`collector` will be the backing service to `pinger`. `collector` will collect and store log data from `pinger`. `collector` is designed to store large amounts of log data so that `pinger` can do what it needs to do without having to work about storage capaicity for logging.

**Step 4:** Take a look at the webserver code for `pinger` by loading the file in the the `vi` editor:

`vi ./pinger/server.js`

**Step 5:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

and then enter:

`:set number`{{execute}}

## Summary

----


***Next: Creating a Backing Service***