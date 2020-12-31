## Objective
The objective of this lesson is identify the shortcoming in this secenario's implementation of the the Command Query Responsibility Segregtation pattern and present an better approach to implementation.

As we saw in the previous lesson, incoming data associated with a `POST` is saved both the `write` and `read` data sources. However, there is a problem. Let's take a look.

## Steps

**Step 1:** Confirm you are in the working directory of the demonstration microservice's source code.

`cd clear && ~/simplecqrs/src && pwd`{{execute T2}

You will see the following output:


**Step 2:** Open `app.ts` in the `vi` editor

`vi app.ts`{{execute T2}}

**Step 3:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

and then enter:

`:set number`{{execute T2}}

**Step 4:** Go down to `Line 60`.

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

`:60`{{execute T2}}

Notice the statement `app.post("/orders", async (req, res) => {...` at `Line 61`. This is the code that adds `order` information to the microservice.

Notice the statement starting at `Line 64`:

```
const order: any = await writeDataManager.setOrder(input)

```
The statement at `Line 64` sends data to the method, `writeDataManager.setOrder(input)` **WHERE** `writeDataManager` is an object that encapsulates access to the `mariadb` write database.

Now go down to `Line 81`. Notice the statement:

```
await readDataManager.setOrder(readInput)

```

Not only has the data been submitted in the `POST` request to `/order` been passed to the `write` database at `Line 64`, also that data is is passed to the `read` database via `readDataManager.setOrder(readInput)`  at `Line 82`.

**Step 5:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

**Step 6:** Exit `vi`

`:q!`{{execute  T2}}

You have exited `vi`.

## Summary

Granted, this approach statisfies the spirit of the CQRS pattern, but it's not a very good approach. First, it violates the principle of [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns). Also, embedding the separation logic in a request handler means that if data sources changes, for example, replacing the `MongoDB` document database with a [DynamoDB](https://aws.amazon.com/dynamodb/) database to store `read` data, that modification will require rewriting code in the request handler function and then a subsequent redeployment of the entire code base. This is a risky undertaking.

The better way to to take an event-driven approach to data management which we'll demonstrate in the next secnario.

 

---

**Congratuations!** You've completed the lab.