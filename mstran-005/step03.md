## Objective
The objective of this lesson exercise the *Seat Saver* hybrid microservice running under GraphQL.

## Steps

### Get GraphQL Playground Up and Running

**Step 1:** Make sure you are in the GraphQL Playground running at the following link:

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

![GraphQL Playground](mstran-005/assets/seat-saver-01.png)

You'll be entering registering to the underlying messaging server as well as executing GraphQL queries and mutation from within the GraphQL Playground UI.

### Making a Simple Query

**Step 2:** Run the query shown below in the left query pan of the GraphQL Playground to get  a list of venues:

```gql
{
  venues{
    id
    seats{
      id
      number
      section
      status
    }
  }
}
```


![Katacoda access 3](mstran-005/assets/katacoda-access-03.png)

You're now ready to exercise the Kubernetes installation of Seat Saver.

### Subscribing to the Message Server

**Step XX:** Click the link below to go to a separate brower window into the GraphQL Playground API for Seat Saver:

https://[[HOST_SUBDOMAIN]]-4000-[[KATACODA_HOST]].environments.katacoda.com/

**Step XX:** #Execute the following GraphQL Query Language code to bind to the subscription, `onSeatReserved`.


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


You get output similar to the following:

```json
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

### Buying a Seat

**Step XX:** In the first browser window for the GraphQL Playground, execute the following GraphQL Query Language code to buy a seat using the Seat Saver API.

```
mutation buySeat($seat: SeatInput!) {
  buySeat(seat: $seat) {
  	 id
    number
    section
    status 
  }
}
```

The GraphQL mutation shown above will buy a seat and also generate a `SeatEvent` message to the subscription, `onSeatSold`. Go to the browser window for the GraphQL Playground instance where you registered the subscription to the message server that listens for `onSeatSold` event messages. You'll see a event message that correlates to the seat you just bought executing the query above.



---

***Next: Understanding the code***