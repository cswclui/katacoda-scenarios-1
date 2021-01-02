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

**Step 7:** Go to `Line 45`.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:45`{{execute T2}}

Notice the statement:

```
const orders = await readDataManager.getOrders()
```

The statement at `Line 46`, above is associated with `GET /orders` at `Line 45`. Notice that since this endpoint represents a query, it is using the the `read` data source as encapsulated in the object, `readDataManager`.

As you look through the web server code in `app.ts` you'll notice that all `GET` requests use `readDataManager`, but that that the `POST` request uses both `writeDataManager` and `readDataManager`. This makes sense. `GET` requests are queries and thus only need to read data. However, the `POST` request is command, and thus it needs to store data in both the `read` data source and `write` data source.

**Step 8:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

**Step 9:** Exit `vi`

`:q!`{{execute  T2}}

You have exited `vi`.

## Summary:

The essential principle driving the CQRS pattern is that `write` data and `read` data are divided into two data stores and that queries use the `read` data store to retrieve data and commands use the `write` data store to store data. This demonstration microservice illustrates the principle. But, there is a problem.

Sending data to the `write` and `read` data sources from the request handler in the web-server satisfies the spirit of CQRS, but it's not a very good way to implement the pattern. Putting logic that segregates write `write`/`read` in the webserver code not only is a violation of the concept of [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns) but also makes the code hard to refactor. We'll address this issue in an upcoming lesson.

In this lesson we've just examined the code logic. In th next lesson weel take a concrete look at the `mariadb` relational database that as the `write` data and the `MongoDB` document database that has the `read` data.

---

***Next: Viewing the data sources***