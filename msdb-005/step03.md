## Objective
The objective of this lesson is to exercise the Saga Pattern code to get a sense of how the microservices coordinate their distributed transactions.

## Steps

**Step 1:** In a second terminal we'll make some HTTP requests using `curl` against `localhost` for the order, payment, and stock services to see the data they have to start with in their local databases

`curl localhost:8080/orders`{{execute T2}}

You'll get output that looks like this:

```
[]
```

This is because no orders have been received yet and so the output is an empty JSON array.  The same output would appear for `curl localhost:8081/account`.

Next execute:
`curl localhost:8082/shipped`{{execute T2}}

You'll get output that looks like this:

```
{"shoes":0,"coat":0,"other":0}
```

This is the shipped order quantity.

Finally execute:
`curl localhost:8082/inventory`{{execute T2}}

You'll get output that looks like this:

```
{"shoes":150,"coat":100,"other":250}
```

This is the current (starting) inventory

**Step 3:** Now in the second terminal window we'll initiate a product order via a `curl` `POST` request

`curl -X POST -H "Content-Type: application/json" localhost:8080/received-order -d '{ "quantity": 2, "product": "coat" }'`{{execute T2}}


You'll get output similar to the following:

```
Received order: 1 of quantity: 2 of product: coat at Wed Mar 24 2021 21:47:34 GMT+0000 (Coordinated Universal Time)
```

First if you click back to the first terminal window you should see some logs generated that look like:

```
order_1    | Received orderId: 1 of quantity: 2 of product: coat at Wed Mar 24 2021 22:16:01 GMT+0000 (Coordinated Universal Time)
payment_1  | Received message: {"orderId":1,"product":"coat","quantity":2,"type":"ReceivedOrder"} from channel: PaymentService at Wed Mar 24 2021 22:16:01 GMT+0000 (Coordinated Universal Time)
payment_1  | Publisher 9f6e3ecb-3baa-4913-b371-1c923476c07a published a message, {"orderId":1,"product":"coat","quantity":2,"type":"ReceivedOrder"} to channel StockService at Wed Mar 24 2021 22:16:01 GMT+0000 (Coordinated Universal Time) with response 1
stock_1    | Received message: {"orderId":1,"product":"coat","quantity":2,"type":"ReceivedOrder"} from channel: StockService at Wed Mar 24 2021 22:16:01 GMT+0000 (Coordinated Universal Time)
order_1    | Publisher f71486ba-579b-4dfb-8961-5bcc20fede58 published a message, {"orderId":1,"product":"coat","quantity":2,"type":"ReceivedOrder"} to channel PaymentService at Wed Mar 24 2021 22:16:01 GMT+0000 (Coordinated Universal Time) with response 1
```

This shows each microservice has taken its appropriate action.  Now if you check the data in the microservices you'll see each has updated data based on the order

`curl localhost:8080/orders`{{execute T2}}

You'll get output that looks like this:

```
[{"orderId":1,"product":"coat","quantity":2}]
```

`curl localhost:8081/account`{{execute T2}}

You'll get output that looks like this:

```
[{"type":"credit","orderId":1,"amount":200}]
```

`curl localhost:8082/shipped`{{execute T2}}

You'll get output that looks like this:

```
{"shoes":0,"coat":2,"other":0}
```

`curl localhost:8082/inventory`{{execute T2}}

You'll get output that looks like this:

```
{"shoes":150,"coat":98,"other":250}
```

So we can see that each of the microservices took appropriate action and updated their local data in a consistent fashion.

**Step 3:** Now in the second terminal window we'll initiate a problematic product order via a `curl` `POST` request.  Firstly we can see that the only products available are `shoes`, `coat`, and `other`.  Let's try to make an order for a product not in that list called `shirt`

`curl -X POST -H "Content-Type: application/json" localhost:8080/received-order -d '{ "quantity": 5, "product": "shirt" }'`{{execute T2}}

You'll get output that looks like this:

```
Received order: 2 of quantity: 5 of product: shirt at Wed Mar 24 2021 22:25:54 GMT+0000 (Coordinated Universal Time)
```

However lets check the first ternimal window to see what sort of logs were generated.

You should see new output generated that looks like:

```
order_1    | Received orderId: 2 of quantity: 5 of product: shirt at Wed Mar 24 2021 22:25:54 GMT+0000 (Coordinated Universal Time)
payment_1  | Received message: {"orderId":2,"product":"shirt","quantity":5,"type":"ReceivedOrder"} from channel: PaymentService at Wed Mar 24 2021 22:25:54 GMT+0000 (Coordinated Universal Time)
payment_1  | Received order for non-existent product, cancelling order
payment_1  | Publisher 22daac05-5dec-4950-bc8b-7d382a25c732 published a message, {"orderId":2,"product":"shirt","quantity":5,"type":"CancelOrder"} to channel OrderService at Wed Mar 24 2021 22:25:54 GMT+0000 (Coordinated Universal Time) with response 1
order_1    | Publisher f71486ba-579b-4dfb-8961-5bcc20fede58 published a message, {"orderId":2,"product":"shirt","quantity":5,"type":"ReceivedOrder"} to channel PaymentService at Wed Mar 24 2021 22:25:54 GMT+0000 (Coordinated Universal Time) with response 1
order_1    | Received message: {"orderId":2,"product":"shirt","quantity":5,"type":"CancelOrder"} from channel: OrderService at Wed Mar 24 2021 22:25:54 GMT+0000 (Coordinated Universal Time)
order_1    | Cancelling order with orderId: 2
```

From the logs we can see that the `order` microservice initially processed the order but after forwarding the `ReceivedOrder` message to the `payment` microservice that service determined the product did not exist and cancelled the order by taking no action and sending the `CancelOrder` back to the `order` microservice which then removes the order from its data

To verify let's take a look at the data in each microservice

`curl localhost:8080/orders`{{execute T2}}

You'll get output that looks like this:

```
[{"orderId":1,"product":"coat","quantity":2}]
```

`curl localhost:8081/account`{{execute T2}}

You'll get output that looks like this:

```
[{"type":"credit","orderId":1,"amount":200}]
```

`curl localhost:8082/shipped`{{execute T2}}

You'll get output that looks like this:

```
{"shoes":0,"coat":2,"other":0}
```

`curl localhost:8082/inventory`{{execute T2}}

You'll get output that looks like this:

```
{"shoes":150,"coat":98,"other":250}
```

So we can see that no data remains related to that order.

**Step 4:** Now in the second terminal window we'll initiate another type of problematic product order via a `curl` `POST` request. In this case we'll make an order that exceeds the available inventory.  We see that we have 150 `shoes` available and we'll try to order 151.

`curl -X POST -H "Content-Type: application/json" localhost:8080/received-order -d '{ "quantity": 151, "product": "shoes" }'`{{execute T2}}

You'll get output that looks like this:

```
Received order: 3 of quantity: 151 of product: shoes at Wed Mar 24 2021 22:32:58 GMT+0000 (Coordinated Universal Time)
```

However lets check the first ternimal window to see what sort of logs were generated.

You should see new output generated that looks like:

```
payment_1  | Received message: {"orderId":3,"product":"shoes","quantity":151,"type":"ReceivedOrder"} from channel: PaymentService at Wed Mar 24 2021 22:53:06 GMT+0000 (Coordinated Universal Time)
payment_1  | Publisher 70903a54-6b26-4a63-99a9-0c4abc088c30 published a message, {"orderId":3,"product":"shoes","quantity":151,"type":"ReceivedOrder"} to channel StockService at Wed Mar 24 2021 22:53:06 GMT+0000 (Coordinated Universal Time) with response 1
order_1    | Received orderId: 3 of quantity: 151 of product: shoes at Wed Mar 24 2021 22:53:06 GMT+0000 (Coordinated Universal Time)
order_1    | Publisher a930dee2-f278-4c65-8dcc-5b1dcbab5120 published a message, {"orderId":3,"product":"shoes","quantity":151,"type":"ReceivedOrder"} to channel PaymentService at Wed Mar 24 2021 22:53:06 GMT+0000 (Coordinated Universal Time) with response 1
stock_1    | Received order for 151 of shoes, current inventory is: 150, cancelling order
payment_1  | Received message: {"orderId":3,"product":"shoes","quantity":151,"type":"CancelOrder"} from channel: PaymentService at Wed Mar 24 2021 22:53:06 GMT+0000 (Coordinated Universal Time)
stock_1    | Publisher d393d965-d709-40c8-b688-a7b7a6c6ae65 published a message, {"orderId":3,"product":"shoes","quantity":151,"type":"CancelOrder"} to channel PaymentService at Wed Mar 24 2021 22:53:06 GMT+0000 (Coordinated Universal Time) with response 1
payment_1  | Publisher 81a58c6b-eef6-496b-b84e-094bf36cd4c2 published a message, {"orderId":3,"product":"shoes","quantity":151,"type":"CancelOrder"} to channel OrderService at Wed Mar 24 2021 22:53:06 GMT+0000 (Coordinated Universal Time) with response 1
order_1    | Received message: {"orderId":3,"product":"shoes","quantity":151,"type":"CancelOrder"} from channel: OrderService at Wed Mar 24 2021 22:53:06 GMT+0000 (Coordinated Universal Time)
order_1    | Cancelling order with orderId: 3
```

Now we can see that the order made it through the `order` and `payment` microservices, but when it reached the `stock` microservice, that service determined there wasn't sufficient inventory and so had to cancel the order (sending the `CancelOrder` message back to the `payment` microservice which would perform a rollback action and then forward to `order` which would also perform a rollback)

Let's check the data in the microservices

`curl localhost:8080/orders`{{execute T2}}

You'll get output that looks like this:

```
[{"orderId":1,"product":"coat","quantity":2}]
```

So we see the order data has been removed

`curl localhost:8081/account`{{execute T2}}

You'll get output that looks like this:

```
[{"type":"credit","orderId":1,"amount":200},{"type":"credit","orderId":3,"amount":7550},{"type":"debit","orderId":3,"amount":7550}]
```

We see here that the payment for the erroneous order isn't removed from the account, but there is a debit entry to reverse the charge (this is a standard accounting rollback action)

`curl localhost:8082/shipped`{{execute T2}}

You'll get output that looks like this:

```
{"shoes":0,"coat":2,"other":0}
```

`curl localhost:8082/inventory`{{execute T2}}

You'll get output that looks like this:

```
{"shoes":150,"coat":98,"other":250}
```

So we see that the shipped and inventory data in the `stock` microservice did not record the erroneous shoes order

---

***Next: Analyzing the code***