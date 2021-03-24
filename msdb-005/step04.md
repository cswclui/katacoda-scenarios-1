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

`tree -L 1`{{execute T2}}

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

Next, look at the `Subscriber` code on `Lines 11-21`.  This code has the function that is called whenever the `order` service receives Saga events from the Redis message broker channel it is listening on (`OrderService`).  The only Saga event that can be received by the `order` service is the `CancelOrder` (forwarded from the `payment` microservice) which triggers `order` to remove the associated order (found by `orderId`) from its database

**Step 5:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

**Step 6:** Exit `vi`

`:q!`{{execute T2}}

You have exited `vi`.

**Step 7:**  Take a look at the file that contains the `payment` code. 

`vi payment/index.js`{{execute T2}}

Turn on line numbering:

**Step 8:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

and then enter:

`:set number`{{execute T2}}

Take a look at the `Subscriber` code on `Lines 13-36`.  This code has the function that is called whenever the `payment` service receives Saga events from the Redis message broker channel it is listening on (`PaymentService`).  There are two Saga events that can be received by the `payment` service. The first is the `ReceiveOrder` (forwarded from the `order` microservice) which triggers `payment` to add an accounting entry to credit the account with the associated value of the order and then forwarding the message onwards to the `stock` service to complete the order processing.  The second is the `CancelOrder` (forwarded from the `stock` microservice) that indicates `stock` encountered an error that requires rollback of the order.  This triggers `stock` to add an entry to the account to debit the appropriate amount to reverse the previous credit transaction and then forward the `CancelOrder` message onwards to the `order` service so it can also rollback its action related to the order.

**Step 9:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

**Step 10:** Exit `vi`

`:q!`{{execute T2}}

You have exited `vi`.

**Step 11:** Take a look at the file that contains the `stock` code.

`vi stock/index.js`{{execute T2}}

Turn on line numbering:

**Step 12:** Turn on line numbering in the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

and then enter:

`:set number`{{execute T2}}

Take a look at the `Subscriber` code on `Lines 11-29`.  This code has the function that is called whenever the `stock` service receives Saga events from the Redis message broker channel it is listening on (`StockService`).  There is only one Saga event that can be received by the `stock` service. This event is the `ReceivedOrder` (forwarded from the `payment` microservice) which triggers `stock` to verify sufficient inventory for the associated product and if there is it will decrement the inventory and increment the shipped quantities for the appropriate product.  If the product is not found or the inventory is insufficient the `stock` microservice will instead leave its data untouched and create and forward the `CancelOrder` Saga event message back to the `payment` microservice to begin the rollback of the other microservice actions.

**Step 13:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq T2}}

**Step 14:** Exit `vi`

`:q!`{{execute T2}}

You have exited `vi`.

## Conclusion 

In closing you can see the basic implementation for setting up a Choreography-based Saga.  The key components are the individual microservices, the message bus used to pass the Saga event messages between them, and the action and rollback code that each microservice undertakes when it receives the appropriate Saga event message

This is a very simplified implementation where the microservices aren't using real databases for storing their local data but conceptually that would look very similar

---

***Congratulations!:*** You've compelete the lab 