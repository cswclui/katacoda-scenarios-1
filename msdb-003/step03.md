## Objective
The objective of this lesson is analyze the demonstration service to learn how it supports the [Command Query Responsibility Segregation](https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs pattern.)

## What You'll Be Doing

In the previous lesson we got the application up and running. Now, let's take a look at how the CQRS pattern is implemented. The place to start is to look at the `write` and `read` endpoints in the `orders` microservice.

The `orders` microservice's exposes itself to the network as a RESTful API that publishes the following endpoints:

* `GET` `/orders`
* `GET` `/orders/:id`
* `POST` `/orders`
* `GET` `/customers`
* `GET` `/customers/:email`

First, let's take a look at the details of the API in code.

## Steps

**Step 1:** Go the TypeScript source code working directory:

`clear && cd ~/simplecqrs/src/`{{execute T2}}

**Step 2:** Take a look at the files and directories in the source code's working directory:

`tree ./ -L 1`{{execute T2}}

You'll get the following output:

```
./
├── app.ts
├── read_db
└── write_db

```

**WHERE**

* `app.ts` is the file that has the code that runs the API's webserver and accepts HTTP `requests` and `responses`.
* `read_db` contains the code and objects for the `read` data source. (Remember, the essential concept behind CQRS is that `read` and `write` behavior is divided between two data sources.
* `write_db` contains the code and objects for the `write` data source.)

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

Notice the statement `app.post("/orders", async (req, res) => {...` at `Line 61`. This is the code that adds `order` information to the microservice.

Notice the statement starting at `Line 64`:

```
const order: any = await writeDataManager.setOrder(input)

```
The statement at `Line 64` sends data to the method, `writeDataManager.setOrder(input)` **WHERE** `writeDataManager` is an object that encapsulates access to the `mariadb` write database. The object, `writeDataManager` uses data models that are stored in files in the directory `write_db`. 

The important thing to understand at this point is that once data is received at the endpoint, `POST /orders`, the data is written to the `write` data source. However, there's more. It's also written to the `read` data source. Let's take a look.

**Step 6:** Go to `Line 81`.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:81`{{execute T2}}

Notice that the statement at `Line 81`.

```
await readDataManager.setOrder(readInput)

```
Not only has the data been submitted in the `POST` request to `/order` been passed to the `write` database at `Line 64`, also that data is is passed to the `read` database via `readDataManager.setOrder(readInput)`  at `Line 82`.

Thus, the `request` data is stored in both the `write` and `read` data sources.

Now, let's take a look at the `read` endpoints.

**Step 7:** Go to `Line 46`.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:46`{{execute T2}}

Notice the statement:

```
const orders = await readDataManager.getOrders()
```

The statement at `Line 46`, above is associated with `GET /orders`. Notice that since this endpoint represents a query, it is using the the `read` data source as encapsulated in the object, `readDataManager`.

As you look through the web server code in `app.ts` you'll notice that all `GET` requests use `readDataManager`, but that that the `POST` request uses both `writeDataManager` and `readDataManager`. This makes sense. `GET` requests are queries and thus only need to read data. However, the `POST` request is command, and thus it needs to store data in both the `read` data source and `write` data source.

**Step 8:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

**Step 9:** Exit `vi`

`:q!`{{execute  T2}}

You have exited `vi`.

We've just examined the code logic. Next let's look at how things pan out in the actual databases. First, lets look at the `write` data source.

**Step 10:** Use the MariaDB administration tool that ships with the lesson to view the contents of the `write` data source. Click the following link:

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

Once you're at the login page for admin application for the relational database, `mariadb`, enter the login credentials shown below.


![Database Access](msdb-003/assets/db_access.jpg)

Notice that there are `customer` and `order` tables, and that they are structured in terms of relational database design.

![Database Admin UI](msdb-003/assets/db_admin_ui.png)

As you can see the `write` data has been stored as expected. Next, let's take a look at the `read` data, which is stored in the MongoDB document database.

In order to view the data in MongoDB, we need to install the MongoDB command line shell within this virtual machine in the Katacoda interactive learning environment.


**Step 11:** Install the MongoDB command line client shell

`curl -O https://downloads.mongodb.com/compass/mongosh-0.6.1-linux.tgz`{{execute T2}}

`mv mongosh-0.6.1-linux.tgz ../mongosh-0.6.1-linux.tgz`{{execute}}

`cd .. && tar -xf mongosh-0.6.1-linux.tgz`{{execute T2}}

`cp mongosh /bin/mongosh`{{execute T2}}

**Step 12:** Go into the MongoDB client line tool: 

`mongosh mongodb://localhost:27017/simplecqrs_r`{{execute T2}}

**Step 13:** Confirm you are in the read data source named, `simplecqrs_r`:

`db`{{execute  T2}}

You'll get output as follows:

`simplecqrs_r`

**Step 14:** Get three documents from the `orders` collection

`db.orders.find().limit(3)`{{execute T2}}

You'll get output similar to the following:

```
[
  {
    _id: '89339b04-9c99-44cc-b0a6-ad8a5bba82e3',
    customer: {
      email: 'Hyman.Bartell@gust.biz',
      firstName: 'Hyman',
      lastName: 'Bartell'
    },
    created: { created: 2020-12-30T05:01:34.280Z },
    description: 'sit voluptatem magnam itaque',
    quantity: 2,
    __v: 0
  },
  {
    _id: '8252695b-4256-4834-b5e5-5ae5b278ef0f',
    customer: {
      email: 'Daron.Spencer@mariam.com',
      firstName: 'Daron',
      lastName: 'Spencer'
    },
    created: { created: 2020-12-30T05:01:34.503Z },
    description: 'molestiae exercitationem eaque qui',
    quantity: 2,
    __v: 0
  },
  {
    _id: '5e08ca35-f1d6-4c73-b2ca-57af074c3a10',
    customer: {
      email: 'Antonetta.Crooks@esperanza.name',
      firstName: 'Antonetta',
      lastName: 'Crooks'
    },
    created: { created: 2020-12-30T05:01:34.540Z },
    description: 'quam est nulla commodi',
    quantity: 4,
    __v: 0
  }
]

```

Querying the MongoDB database using the command line tool reveals that data that was written to `POST` `/orders` when we seeded the database as the beginning of this scenario is indeed in the `read` data source too.

**Step 15:**  Leave the command line tool:

`exit`{{execute}}

As you can see, all `order` data has been stored in both the `write` data store and the `read` data store. The microservice is in sync.

## Summary:

The essential principle driving the CQRS pattern is that `write` data and `read` data are divided into two data stores and that queries use the `read` data store to retrieve data and commands use the `write` data store to store data. This demonstration microservice illustrates the principle. But, there is a problem.

Sending data to the `write` and `read` data sources from the request handler in the web-server satisfies the spirit of CQRS, but it's not a very good way to implement the pattern. Putting logic that segregates write `write`/`read` in the webserver code not only is a violation of the concept of [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns) but also makes the code hard to refactor.

The next lesson will look at this problem in detail and suggest a way to address the issue at hand.


---

***Next: Identifying opportunities for improvement***