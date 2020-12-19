## Objective
The objective of this lesson is demonstrate how to get the demonstration code up and running

## Steps

**Step 1:** Go to the directory of the *Burger Queen* service of *Food Court*.

`cd burgerqueen`{{execute T1}}

**Step 2:** Install the application's depedencies

`npm install`{{execute T1}}

**Step 3:** Run the unit tests

`npm test`{{execute T1}}

You'll get output similar to the following:

```
> burgerqueen@1.0.0 test /root/12factor/burgerqueen
> mocha test

Burger Queen, API Server is started on 3000  at Sat Dec 19 2020 17:49:30 GMT+0000 (Coordinated Universal Time), with pid 2446
  API Tests:
{ restaurant: 'Burger Queen', order: 'whooper' }
    ✓ Can access GET item /

  API Tests:
{
  status: 'SHUTDOWN',
  shutdownMessage: 'Burger Queen API Server shutting down at Sat Dec 19 2020 17:49:30 GMT+0000 (Coordinated Universal Time)',
  pid: 2446
}

```

**Step 4:** Start up the *Burger Queen* service

`clear && node index.js`{{execute T1}}

You'll see the output similar to the following:

```
Burger Queen, API Server is started on 3000  at Sat Dec 19 2020 17:28:52 GMT+0000 (Coordinated Universal Time), with pid 3921

```

The *Burger Queen* service is up and running.

---

***Next: Instigating shutdown of a service***