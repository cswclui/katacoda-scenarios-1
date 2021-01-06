## Objective
The objective of this lesson is view the various data sources used to implement the Command Query Responsibility Segregation (CQRS) pattern.

## What You'll Be Doing

In the last lesson you looked at the source code that separated `write` behavior from `read` behavior. This separation is an essential concept to the CQRS pattern.

In this lesson you're going to look at the actual `mariadb` relational databsase where the `write` data is stored and `MongoDB` document database where the `read` data is stored.

## Steps

**Step 1:** Use the MariaDB administration tool that ships with the lesson to view the contents of the `write` data source. Click the following link:

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/

Once you're at the login page for admin application for the relational database, `mariadb`, enter the login credentials shown below.

![Database Access](msdb-003/assets/db_access.jpg)

Notice that there are `customer` and `order` tables, and that they are structured in terms of relational database design.

![Database Admin UI](msdb-003/assets/db_admin_ui.png)

Follow the illustration below to access the data in the `order` table. (1) Click on `order` in the table column. Then, (2) click on `Select data` in the `order` detail page. (Click on the image to get a larger, expanded view.)

![Database Admin UI](msdb-003/assets/mariadb-ui-steps.png)

Now, let's look at the `read` data in MongoDB.

In order to view the data in MongoDB, we need to install the MongoDB command line shell within this virtual machine in the Katacoda interactive learning environment.


**Step 2:** Install the MongoDB command line client shell

`curl -O https://downloads.mongodb.com/compass/mongosh-0.6.1-linux.tgz`{{execute T2}}

`mv mongosh-0.6.1-linux.tgz ../mongosh-0.6.1-linux.tgz`{{execute}}

`cd .. && tar -xf mongosh-0.6.1-linux.tgz`{{execute T2}}

`cp mongosh /bin/mongosh`{{execute T2}}

**Step 3:** Go into the MongoDB client line tool: 

`mongosh mongodb://localhost:27017/simplecqrs_r`{{execute T2}}

**Step 4:** Confirm you are in the read data source named, `simplecqrs_r`:

`db`{{execute  T2}}

You'll get output as follows:

`simplecqrs_r`

**Step 5:** Get three documents from the `orders` collection

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

Querying the MongoDB database using the command line tool reveals that data that was written to `POST` `/orders` when we seeded the database as the beginning of this scenario is also in the `read` data source.

**Step 6:**  Leave the command line tool:

`exit`{{execute}}

As you can see, all `order` data has been stored in both the `write` data store and the `read` data store. The microservice is in sync.


## Summary

Granted, the approach demonstrated in this lesson for writing data to both the `write` and `read` data sources statisfies the spirit of the CQRS pattern, but it's not a very good approach. First, it violates the principle of [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns). Also, embedding the separation logic in a webserver's request handler means that if data sources changes, for example, replacing the `MongoDB` document database with a [DynamoDB](https://aws.amazon.com/dynamodb/) database to store `read` data, that modification will require rewriting code in the request handler function and then a subsequent redeployment of the entire code base. This is a risky undertaking.

The better way to to take an event-driven approach to data management which we'll demonstrate in the next scenario. But, first let's look at the shortcoming in more detail in the next lesson.

---

***Next: Identifying opportunities for improvement***