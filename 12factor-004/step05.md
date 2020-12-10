## Objective
The objective of this lesson is to provide an example of the *Pinger* webservice using the backing service *Collector*.

## What you'll be doing

In this lesson we're going to start the both the *Pinger* and the associate backing service *Collector*. (This are both Node.js applications running as a webserver). The *Collector* backing service will bind automatically to the underlying Redis database that we started in a Docker container at the beginning of this scenario.

Once every thing is up and running, we'll make a call to to *Pinger* using `curl`. Calling `curl` will generate a request to *Pinger*. *Pinger* will record the request using its `logger` and then create and return a response. The `logger` in turn will send the contents of the request onto the backing service, *Collector*. (We covered how `logger` works in a previous lesson.

We'll do 3 calls to *Pinger* using `curl`. Then, we'll check the keys of the data stored in the Redis database from the command line. Inspecting the Redis keys will correlate with the request logging activity that took in *Pinger*.

## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If the working directory is not `/root/12factor`, execute the following command:

`cd /root/12factor`{{execute T1}}

**Step 2:** Install the dependencies for both the *Pinger* and *Collector* applications.

`npm install ./pinger && npm install ./collector`{{execute}}

**Step 3:** In a second terminal window, start up *Collector*.

`cd ~/12factor/collector && node index.js`{{execute T2}}

You will see output similar to the following (the date will be different):

```
Collector Server started on port 4001 at Thu Dec 10 2020 20:28:55 GMT+0000 (Coordinated Universal Time)

```

**Step 4:** In a third terminal window, start up *Pinger*.

`cd ~/12factor/pinger && node server`{{execute T2}}

**Step 5:** In the first terminal window, make a `curl` call to *Pinger* which is running on `localhost:3040`.

`clear && curl localhost:3040`{{execute T1}}

**Step 6:** Make a second call to *Pinger*

`clear && curl localhost:3040`{{execute T1}}

**Step 7:** Make a third call to *Pinger*

`clear && curl localhost:3040`{{execute T1}}

**Step 8:** Navigate into the shell of the Docker container the is running Redis

`sudo docker exec -it innoredis sh`{{execute T1}}

You'll see the container's command prompt as output:

`#`

**Step 9:** Start the `redis-cli` tool so that you can communicate with the `redis` database

`redis-cli`{{execute T1}}

You'll the following output which is the command line for the `redis-cli`:

`127.0.0.1:6379>` 

**Step 10:** Get the keys to all the records stored in the Redis database by executing the Redis `KEYS` command under the Redis CLI.

 `KEYS *`{{execute T1}}
 
 As a return you will get a list of Universally Unique Identifiers (UUID)
 
 ```
 TBD
 
 ```
 
Now, return to the command prompt of the virtual machine in the interactive learning environment.
 
 **Step 11:** Exit out the the `redis-cli`:

`exit`{{execute T1}}

You'll see the following output

`#`

**Step 12:** Exit `redis` container

`exit`{{execute T1}}

You'll see the following output

`$`

You have exited Redis and are back at the command prompt of the virtual machine in the interactive learning environment.


## Summary

---

**Congratuations!** You've completed the lab


