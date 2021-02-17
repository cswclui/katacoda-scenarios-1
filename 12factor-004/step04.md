## Objective
The objective of this lesson is to see a demonstraton of how teh backing service, *Collector* was created.

All the source code for *Collector* in directory, `./12factor/collector`. Well examine the files in this directory during our analysis.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If the working directory is not `/root/12factor`, execute the following command:

`cd /root/12factor`{{execute T1}}

**Step 2:** View the contents of the directory, `./12factor/collector`

`clear && tree ./collector -L 2`{{execute}}

You'll see output as follows:

```
./collector
├── datastore
│   └── index.js
├── index.js
├── package.json
└── test
    └── api-tests.js

2 directories, 4 files
```

The backing service *Collector* has two parts. The first is the file,`index.js` which is the source code for the API which receives the HTTP request for the logger. The second is the code that binds the *Collector* to the underlying Redis database. This code is in the file `./datastore/index.js`.

Let's look at the API code first.

**Step 3:** Open the source code for the *Collector* API in the `vi` editor:

`vi ./collector/index.js`{{execute}}

**Step 3:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

and then enter:

`:set number`{{execute}}

`Lines 16 -28` contain the code that accepts the HTTP POST request.

Notice that `Line 23` is the code that does the work of saving the incoming request to the Redis database. This is the code:

`const rslt = await write(newData);`

The `write` method which is used at `Line 23` is declared earlier in the file at `Line 5`. The `write` method is the result of a Node.js `exports` from the `./collector/datastore/index.js` file. This file is where the Redis binding takes place. We'll look at this next, but first we need to close down the `vi` editor. 

**Step 4:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 5:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

Next we'll take a look at how *Collector* binds to Redis in the file,  `./collector/datastore/index.js` 


---
**A NOTE ABOUT USING REDIS:**

In this demonstration we're representing the backing service that collects log data as a custom API that binds to an associated Redis database. While it's true that could have bound the `logger` in *Pinger* directly to the Redis database and not really violated the 12 Factor principle of Back Service, binding the `logger` directly to Redis impairs the ease of rebinding to a storage mechanism other than Redis.

The `logger` in *Pinger* emits JSON which is a widely supported data format. And the underlying network protocol is simple HTTP. Thus, `logger` can bind to any backing service that accepts JSON and HTTP. However, were we to have the logger bind to Redis directly, then the only other backing service for data storage we could use is Redis. To use another backing service such as Kafka would involve going into the `logger` source code and rewriting a lot of it to support Kakfa.

Representing Redis through and RESTful API that accepts JSON via a POST makes things simple and versatile.

---

**Step 6:** Open the file, `./collector/datastore/index.js` in the `vi` editor

`vi ./collector/datastore/index.js`{{execute}}

**Step 7:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

and then enter:

`:set number`{{execute}}

*Collector* binds to Redis using the Node.JS [Redis package](https://www.npmjs.com/package/redis) on NPM. The code that imports the package is at `Line 1`. All the work of interacting with Redis is done by the package. All the *Collector* needs to provide is the connection URL which is done at `Line 6` at the statement:

`const client = redis.createClient({host,port});`

Notice that the code does look for the environment variables, `COLLECTOR_DELEGATE_HOSTNAME` and `COLLECTOR_DELEGATE_PORT` at `Lines 1 -2`, following the 12 Factor App principle of Config. But, if the environmental variables are not provided, the code will default to `localhost:6379` which is the default host and port for Redis. This is done as a matter of convenience for the developer.

The actual work of writing the the Redis database is done at `Lines 18 - 26`.

The code will read from the Redis database according the key value created at `Lines 19` using the `uuidv4()` method from the Node.js [uuid](https://www.npmjs.com/package/uuid) package and passed by the call to Redis at `Line 20`, via the `setAsync` method which is derived from the Node.JS [Redis package](https://www.npmjs.com/package/redis).

As you can see, the backing service, *Collector* is a [RESTful](https://restfulapi.net/) API that represents a Redis database.

Now that we've analyzed data write features of *Collector* close up the `vi` editor.

**Step 8:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 9:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

## Summary

At this point you should have a conceptual sense of how the application *Pinger* use the backing service *Colllector* to store log data.

In the next lesson we'll make spin up both *Pinger* and *Colllector* and demonstrate the code in action.
---

***Next: Using a Backing Service***


