## Objective
The objective of this lesson is to analyze the Saga Pattern code to see how it is implemented.

## What You'll Be Doing
In this lesson we're going to look at how the Choreography-based Saga Pattern is implemented in the `order`, `payment`, and `stock` microservices.

![Choreography-based Saga](msdb-005/assets/choreography-saga.png)

The approach taken is to use Redis as a message broker with 3 channels (one for each service `order`, `payment`, and `stock`).  The Saga event signalling happens via these channels with the message `ReceivedOrder` indicating an order was received and processed and `CancelOrder`that a problem occurred and all actions should be rolled-back.  All 3 services are also simple expressjs apps exposing 1-2 endpoints for HTTP requests.


## Steps

**Step 1:** Confirm you're in the working directory:

`clear && cd /root/microservices-db-saga/simple-saga && pwd`{{execute T2}}

**Step 2:** Take a look at the directory and file structure of the working directory

`tree -L 1`{{execute T1}}

You'll get following output:

```
.
├── docker-compose.yml
├── docker-seed.sh
├── order
├── payment
├── stock
└── upgrade-docker-compose.sh

3 directories, 3 files
```

**WHERE**

* 
* `order`, `payment` and `stock` are folders that contain the code and Dockerfiles for the `order`, `payment`, and `stock` microservices
* `docker-compose.yml` is the file the contains the `Docker Compose` configuration settings to start Redis and the microservices containers
* `upgrade-docker-compose.sh` is a simple bash script to upgrade the version of docker-compose on the lab machine
* `docker-seed.sh` is a simple bash script to build the container images for the `order`, `payment`, and `stock` microservices


**Step 3:** Take a look at the file that contains the `order` code. 

`vi order/index.js`{{execute T2}}

Turn on line numbering:

**Step 4:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

and then enter:

`:set number`{{execute T2}}

Take a look at the `expressjs app.post` function which starts at `Line 31`. We can see the function reads the JSON body of the HTTP request and used the `product` and `quantity` properties to create a new order and inserts it to the local database (in this simple case its just an array object in memory).

Then it creates the Saga event message `ReceivedOrder` to be sent via the Redis message broker to the `payment` microservice

Next, look at the `Subscriber` code on `Lines 11-21`.  This code has the function that is called whenever the `order` service receives Saga events from the Redis message broker channel it is listening on `OrderService`.  The only Saga event that can be received by the `order` service is the `CancelOrder` (forwarded from the `payment` microservice) which triggers `order` to remove the associated order (found by `orderId`) from its database

**Step 5:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

**Step 6:** Exit `vi`

`:q!`{{execute T2}}

You have exited `vi`.

**Step 7:**  that has the `report_gen` web server source code:

`cd ~/fortune-cookies/monolith_strangled/report_gen/`{{execute T1}}

**Step 8:** Take a look at the web server code:

`vi index.js`{{execute T1}}

Turn on line numbering:

**Step 9:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T1}}

The code of interest is betweel `Lines 7 - 25`.

Notice at `Line 18` that the code uses the `getSentFortunes()` method from the `DataManager` component to access the *sent fortunes* data in the data source. As mentioned above, `DataManager` encapsulates data access activities to and from the external data source. The method, `getSentFortunes()` takes a single optional argument, `limit`. `limit` is derived from the `request` query parameter of the same name. If `request.query.limit` contain a numeric value, then `DataManager.getSentFortunes(limit)` will return the number of fortunes defined by `limit`. Otherwise, `DataManager.getSentFortunes()` will return the default number of rows, `10`,

**Step 10:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

**Step 11:** Exit `vi`

`:q!`{{execute T1}}

You have exited `vi`.

## Conclusion 

In closing you can see that by adding a new component, `DataManager` and adding a few lines of new code in `sender` we've made it so *Fortune Cookies* can export *sent Fortunes* data to an external data source. Once the data is externalized, it can be consumed by any interested party such as `report_gen`.

Of course, there is more work to do. Eventually `sender` will need to be disconnected from the monolithic *Fortune Cookies* completely. This will take a lot more work. But, no matter what, starting to strangle `sender` by emitting it's data to an external data source is an important first step.

---

***Congratulations!:*** You've compelete the lab 