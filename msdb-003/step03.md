## Objective
The objective of this lesson is demonstrate how to [TO BE PROVIDED]

## Steps

[TO BE PROVIDED]


**Step XX:** Use the MariaDB administration tool that ships with the lesson to view the contents of the `write` data source. Click the following link:

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/


![Database Access](msdb-003/assets/db_access.jpg)

Notice that there are `customer` and `order` tables, but the structured in terms of relational database design.


![Database Admin UI](msdb-003/assets/db_admin_ui.png)

**Step XX:** Install the MongoDB command line client shell

`curl -O https://downloads.mongodb.com/compass/mongosh-0.6.1-linux.tgz`{{execute}}

`mv mongosh-0.6.1-linux.tgz ../mongosh-0.6.1-linux.tgz`

`cd .. && tar -xf mongosh-0.6.1-linux.tgz`{{execute}}

`cp mongosh /bin/mongosh`{{execute}}

**Step XX:** Go into the MongoDB client line tool: 

`mongosh mongodb://localhost:27017/simplecqrs_r`{{execute}}

**Step XX:** Confirm you are in the read data source named, `simplecqrs_r`:

`db`{{execute}}

You'll get output as follows:

`simplecqrs_r`

**Step XX:** Get three documents from the `orders` collection

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

**Step XX:**  Leave the command line tool:

`exit`{{execute}}


---

***Next: Identifying opportunities for improvement***