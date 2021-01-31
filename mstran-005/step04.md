## Objective
The objective of this lesson is to analyze the demonstration service, *Seat Saver* in order to understand how it uses GraphQL to implement a hybrid microservice.

## Summary

The point of this lesson is to describe and demonstrate the nature of a hybrid microservice as implemented under GraphQL.

GraphQL is a technology that was created at Facebook and now used widely in variety of ways in enterprise development. It's an versatile yet complex technology. Going into the details of how GraphQL works is beyond the scope of the scenario.

The important point to understand about GraphQL as an implementation of a hybrid microservice is the it allows consumers to interact with a microservice using both synchronous and asynchronous communication. In addition, GraphQL satisfies an essential principle of microservice design: a microservice must carry its own data.

![Hybrid Architecture](mstran-005/assets/general-architecture.png)

A hybrid implementation of a microservice is useful when consumers need to have the benefit offered by the immedicacy of a synchronous request/response interaction. Also, the added benefit of asynchronous interactions provides a way to take an event-driven approach to microservice design. In a way, hybrid microservices offer the best of both worlds but they must be used judiciously. The style is not a one-size fits all solution.

---

**Congratuations!** You've completed the lab.