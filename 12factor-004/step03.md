## Objective
The objective of this lesson is to bind the demonstration application to the Backing Service created in the last lesson.

In the previous lesson you examined the source code for *Pinger's* web server. You'll have noticed the the code as using a `logger` to keep a record of requests comming into *Pinger*.

In this lesson we'll look at the details of the the logger as well as the environment configuration settings that binds *Pinger* to the backing service *Collector*. *Collector* is the backing service to which the logger binds.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If the working directory is not `/root/12factor`, execute the following command:

`cd /root/12factor`{{execute T1}}

**Step 2:** Open the the logger's source code in `vi`.

`vi ./pinger/logger/index.js`{{execute}}

**Step 3:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

and then enter:

`:set number`{{execute}}

Notice the code at `Line 4`:

```
const url = `http://${process.env.COLLECTOR_HOSTNAME}:${process.env.COLLECTOR_PORT}`

```

The variable `url` defines the location on the network where the logger will send data. The actual logging mechanism that sends the log data to the HTTP endpoint defined by the variable `url` is in the external Node.js packages, [pino](https://www.npmjs.com/package/pino) and [pino-http-send](https://www.npmjs.com/package/pino-http-send) that are declared at `Lines 1 - 2` at the start of the logger souce code.

At the logical level what's happening is that the program sends the incoming `request` to the logger and the logger sends the data to be logged on to the endpoint on the Internet. The declaration of the endpint URL is made int ghe logger source code. But, again when we examine the critical piece of code:

```
const url = `http://${process.env.COLLECTOR_HOSTNAME}:${process.env.COLLECTOR_PORT}`

```
You'll see that the URL definition is composed of values from the environment varialbles `COLLECTOR_HOSTNAME}` and `COLLECTOR_PORT`. The question is, where and how are these environment variables set. To answer this question we need to look at the `.env` file for *Pinger`, which we'll do in a moment. But first let's get out of `vi`.

**Step 4:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 5:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

**Step 6:** Now, let's take a look at *Pinger's* `.env` file.

`clear && cat ./pinger/.env`{{execute}}

You'll get the following output:

```
PINGER_PORT=3040
PINGER_ADMIN=true
CURRENT_VERSION="3-config.0.0.1"
COLLECTOR_HOSTNAME=localhost
COLLECTOR_PORT=4001

```

The `.env` file contains the values for the environment variables `COLLECTOR_HOSTNAME` && `COLLECTOR_PORT`. Thus, in this case the endpoint for the backing service is, `http://localhost:4001`.

Putting the definition of the endpoint to backing service should seem familiar becuase this is an prime example of the third principle of 12 Factor App - Config.

In the next lesson we'll look the details of creating backing service.

## Summary

---

***Next: Creating a backing service***




