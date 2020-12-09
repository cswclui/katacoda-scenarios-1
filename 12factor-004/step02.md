## Objective
The objective of this lesson is to demonstrate how use and manage external configuration according to the [Backing Services](https://12factor.net/config) principle of 12 Factor App in order to make an applications flexible, scalable and easier to change.

In this lab we're going to evolve the lab's demonstration application to learn how to delegate data storage to an external resource.

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
TBD

```
**Step 3:** Take a look at the contents of the demonstration application's working directory.

`clear && tree -L 2`{{execute}}

You'll see output as follows:

```
TBD

```

## Summary

----


***Next: Creating a Backing Service***