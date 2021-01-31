## Objective
The objective of this lesson exercise the *Seat Saver* hybrid microservice running under GraphQL.

## Steps

### Get GraphQL Playground Up and Running

**Step 1:** Make sure you are in the GraphQL Playground running at the following link:

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

![GraphQL Playground](mstran-005/assets/seat-saver-01.png)

You'll be entering registering to the underlying messaging server as well as executing GraphQL queries and mutation from within the GraphQL Playground UI.

### Making a Simple Query

**Step 2:** Run the query shown below in the left query pane of the GraphQL Playground. Once the code is pasted in the left pane, click the play button (>) to get list of venues:

```
{
  venues{
    id
    name
  }
}

```

You'll get output simlar to the following:

```
{
  "data": {
    "venues": [
      {
        "id": "5ffe25d178ada321ab27beb1",
        "name": "aut aliquam"
      },
      {
        "id": "5ffe25d278ada3123a27c0d4",
        "name": "et exercitationem"
      },
      {
        "id": "5ffe25d278ada3582227c2f7",
        "name": "voluptatem porro"
      }
    ]
  }
}

```

![Simple Query](mstran-005/assets/graphql-query-01.png)

**NOTE:** As you can see above, the demonstration project applies a random string value to the `name` field of a `venue`.

Take note of an `id` of one of the venues. You'll use the `id` to retrieve `seat` data associated with a particular `venue`. In this case well get the seat data for the `venue` with the id of `5ffe25d278ada3582227c2f7`.

**Step 2:** Execute a query against a particular `venue` in the GraphQL API getting the `status`, `section` and `number` data for each `seat` in the `venue`. Copy the code below which is in GraphQL Query Language (gql) in the left pane of the browser window of the GraphQL Playground **Don't forget** to use a venue `id` the query you ran previously. Each instance of **Seat Saver** will create its own unique `id` values for `venue`. 


```
{
  venue(id:"5ffe25d278ada3582227c2f7"){
    seats{
      status
      section
      number
    }
  }
}

```

You'll get output similar to the following:

 ```
 {
  "data": {
    "venue": {
      "seats": [
        {
          "status": "OPEN",
          "section": "Section-A",
          "number": "A0"
        },
        {
          "status": "OPEN",
          "section": "Section-A",
          "number": "A1"
        },
        {
          "status": "OPEN",
          "section": "Section-A",
          "number": "A2"
        },
 .
 .
 .       
 
 ```
![Simple Query](mstran-005/assets/graphql-query-02.png)

You're now ready to register to the message server that is internal to the GraphQL API in order to receive notifications when the status of a seat changes. The formal term in GraphQL for registering with the message server is `subscribing`. (Go [here](https://dgraph.io/docs/graphql/subscriptions/) to learn more about GraphQL Subscriptions.)

### Subscribing to the Message Server

**Step 3:** Click the new tab button (+) at the top left of the GraphQL Playground menu bar and then enter the following gql code:

```
subscription onSeatReserved{
  onSeatReserved{
    venueId
    message
    number
    section
    status
    seatId  
  }
}
```
Click the the play button (>) to execute the following gql code to bind to the subscription, `onSeatReserved`.

You'll see the term, "Listening ..." in the lower part of the right side pane in the GraphQL Playground web browser window.

 ![Grpahql Subscription](mstran-005/assets/on-subscription-02.png)

You are now registered to receive a message when a `seat` is reserved within the *Seat Save* GraphQL API.

Let's reserve a seat.


### Reserving a Seat

In order reserve a `seat` in a venue using the *Seat Saver* API, you need to send the API the following information:

* `venueId`, the unique identifier of the venue that has the `seat`
* `number`, the unique number of the `seat`
* `customer`, the `firstName`, `lastName` and `email` of the person buying the seat.

We'll put this information into a GraphQL [query variable](https://blog.apollographql.com/the-anatomy-of-a-graphql-query-6dffa9e9e747) within the GraphQL Playbround.

**Step 4:** In the first browser window for the GraphQL Playground,  enter the following gql code that defines the query variable in the query variable pane into the lower left of the GraphQL Playground browser window.

```
{
  "seat": {
    "venueId": "5ffe25d278ada3582227c2f7",
    "number": "A0",
    "customer": {
      "firstName": "Gonzalo",
  		"lastName": "Considine",
  		"email": "Gonzalo.Considine@dagmar.name" 
    }
  }
}

```

(**Don't Forget!** When creating the query variable to reservice a set use one of the venue `id` values that are special to your running instance of Seat Saver. You discovered the available `id` values above in **Step 2**.)

![Setting Query Variable](mstran-005/assets/setting-query-var.png)

**Step 5:** In GraphQL Playground query window on the upper left enter and execute the following GraphQL Query Language code to reserve a seat using the Seat Saver API.

```
mutation reserveSeat($seat: SeatInput!) {
  reserveSeat(seat: $seat) {
    id
    number
    section
    status 
  }
}
```

![Query Variable](mstran-005/assets/query-query-01.png)
 
Upon succesful execution of the mutation, you'll get output similar to the following:
 
```
{
  "data": {
    "onSeatReserved": {
      "venueId": "5dce2cabba1d1d320106525a",
      "message": "Reserving Seat",
      "number": "A0",
      "section": null,
      "status": "RESERVED",
      "seatId": null
    }
  }
}
```
![Query Result](mstran-005/assets/query-result-01.png)

The GraphQL mutation shown above will reserve a seat and also generate a `SeatEvent` message to the subscription, `onSeatReserved`. Go to the browser window for the GraphQL Playground instance where you registered the subscription to the message server that listens for `onSeatSold` event messages. You'll see a event message that correlates to the seat you just bought executing the query above.

![On Seat Reserved Message](mstran-005/assets/onseatreserved-01.png)

You'll see that a message was sent to that browser window indicating that an `onSeatReserved` event was raised an a measage was sent.

You've just experienced in the hybrid nature of the GraphQL. The next lesson will elaborate on the the hybrid style of microservices as demonstrated in this code exercise.

---

***Next: Understanding the code***