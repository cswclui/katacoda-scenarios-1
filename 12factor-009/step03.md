## Objective
The objective of this lesson is demonstrate how instigate a service shutdown and to observe an example of graceful termination as recommended by the Disposability principle of 12 Factor App.

## Steps

**Step 1:** Send a `ctrl+c` exist command to the process running the *Burger Queen* service in the first terminal window

``echo "Send ctrl+c to terminate the Burger Queen service"`{{execute interrupt}}

You'll get the following output:

```
{
  status: 'SHUTDOWN',
  shutdownMessage: 'Signal SIGINT : Burger Queen API Server shutting down at Sat Dec 19 2020 17:35:59 GMT+0000 (Coordinated Universal Time)',
  pid: 3921
}

```

Notice that the *Burger Queen* service as emitted a message in JSON that reports that the service is shutting down along with information about the time that the service was terminated and the process id in which the service was running.

This a basic indicator that the service is intending to do a graceful shut down. Of course, the internals of the service must also do the "clean up" work necessary for a graceful shutdown physically.

---

***Next: Analyzing the shutdown code***