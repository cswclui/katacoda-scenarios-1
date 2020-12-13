## Objective
The objective of this lesson is exercise the *Food Court* demonstration application that we've installed and invoked in previous lessons.

In previous lessons we installed the demonstration application, *Food Court* as a set of processes represented as containers that run under Docker Compose.

Running the processes as independent containers complies with the 12 Factor principle of Processes.

The only entry point into the *Food Court* application is to call the `customer` process which will, in turn, call one of the restaurant processes at random. (Docker Compose was configure to only expose the process `customer` at port 4000.)

Calling the `customer` process via `localhost:4000` will make it so that the `customer` subsequently call a restaurant process.

## Steps

**Step 1:** Make 20 calls on the application using `curl`;

`for i in {1..20}; do curl localhost:4000 -w "\n"; done`{{execute}}

You'll get output similar to, but not exactly like the following:

```
{"restaurant":"Howard Bonsons","order":"grilled cheese","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"fries","customer":"Friendly Shopper"}
{"restaurant":"Iowa Fried Chicken","order":"Chix Pack","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"grilled cheese","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"burger","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"fried shrimp","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"fried shrimp","customer":"Friendly Shopper"}
{"restaurant":"Iowa Fried Chicken","order":"Spicy Wings","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"soda and fries","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"whooper","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"double burger","customer":"Friendly Shopper"}
{"restaurant":"Iowa Fried Chicken","order":"Spicy Wings","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"grilled cheese","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"whooper","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"grilled cheese","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"fried shrimp","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"fries","customer":"Friendly Shopper"}
{"restaurant":"Burger Queen","order":"whooper","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"grilled cheese","customer":"Friendly Shopper"}
{"restaurant":"Howard Bonsons","order":"fried shrimp","customer":"Friendly Shopper"}
```

Notice that there have been 20 calls to the`customer` process and that in turn each call to `customer` created a call to a restuarant. The output above is responses from `customer`. `customer` reports which `restaurant` it called, what the `order` was, as well as the name of the `customer `making the purchase.

## Summary

The important thing to understand about the *Food Court* application is that it demonstrates the 12 Factor App princple of Processes. Each of the components that make up fo the *Food Court* application exists as distinct processes their own process space. Each process is indepedent. No code is shared among any.

---

**Congratuations!** You've completed the lab.