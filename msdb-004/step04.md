## Objective
The objective of this lesson is demonstrate how to view the actual data that's been generated during the seeding process to discover how the the CQRS is supported in a concrete manner.

## What You'll Be Doing

In the last lesson you examined the source code to see how the CQRS pattern is implemented in an event-drive architecture. In this lesson you are going to look at the the data sources to get a sense of how data is actually separated.

You'll look at the `mariadb` database that stores the `write` data and the `MongoDB` database that has the `read` data. And, you'll take a look on the Kafka message broker to view the messages that are stored after emission. Remember, Kakfa will keep a record of every message it sends.

## Steps

**Step 1:** Use the MariaDB administration tool that ships with the lesson to view the contents of the `write` data source. Click the following link:

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/


![Database Access](msdb-003/assets/db_access.jpg)

Notice that there are `customer` and `order` tables, but the structured in terms of relational database design.


![Database Admin UI](msdb-003/assets/db_admin_ui.png)

**Step 2:** Install the MongoDB command line client shell

`curl -O https://downloads.mongodb.com/compass/mongosh-0.6.1-linux.tgz`{{execute}}

`mv mongosh-0.6.1-linux.tgz ../mongosh-0.6.1-linux.tgz`{{execute}}

`cd .. && tar -xf mongosh-0.6.1-linux.tgz`{{execute}}

`cp mongosh /bin/mongosh`{{execute}}

**Step 3:** Go into the MongoDB client line tool: 

`mongosh mongodb://localhost:27017/simplecqrs_r`{{execute}}

**Step 4:** Confirm you are in the read data source named, `simplecqrs_r`:

`db`{{execute}}

You'll get output as follows:

`simplecqrs_r`

**Step 5:** Get three documents from the `orders` collection

`db.orders.find().limit(3)`{{execute}}

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

**Step 6:**  Leave the command line tool:

`exit`{{execute}}

**Step 7:**  Install the Kafka command line tool:

`npm install -g kafka-cli`{{execute T2}}

**Step 8:**  Take a look at the messages on the topic:


`kfk consumer`{{execute T2}}

`localhost:9092`{{execute T2}}

`OnNewOrder`{{execute T2}}

`0`{{execute T2}}

You get output similar to the following abbeviation of message stored in Kafka:

```
.
.

{
  topic: 'OnNewOrder',
  value: '{"description":"repellendus aut et eaque","email":"Alexanne.Glover@augusta.biz","eventName":"OnNewOrder","firstName":"Alexanne","lastName":"Glover","orderId":"0a506ec8-17c8-4260-ab33-ce145cc7a233","quantity":6}',
  offset: 0,
  partition: 0,
  highWaterOffset: 10,
  key: '0a506ec8-17c8-4260-ab33-ce145cc7a233'
}
{
  topic: 'OnNewOrder',
  value: '{"description":"ipsam consequatur ipsam est","email":"Tracy.Hilpert@michele.info","eventName":"OnNewOrder","firstName":"Tracy","lastName":"Hilpert","orderId":"24ad3aa1-bf2e-46c6-a746-956de48737cb","quantity":1}',
  offset: 1,
  partition: 0,
  highWaterOffset: 10,
  key: '24ad3aa1-bf2e-46c6-a746-956de48737cb'
}
.
.

```

**Step 9:** Exit the Kafka command line tool

`exit`{{execute T2}}  

---

***Next: Identifying opporunities for improvement.***