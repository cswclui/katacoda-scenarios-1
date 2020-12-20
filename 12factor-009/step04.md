## Objective
The objective of this lesson is to view the web server code for the *Burger Queen* service to analyze how the service support the Disposability principle of 12 Factor App.

**NOTE:** Although the code for the *Burger Queen* service is written in Node.js, general way that graceful shutdown is accomplished can be implemented in any language.

## Steps

**Step 1:** Confirm you are in the working direcotyr for the *Burger Queen* service.

`cd /root/12factor/burgerqueen && pwd`{{execute T1}}

You should see the following output:

`/root/12factor/burgerqueen`

**Step 2:** Open the source code for the *Burger Queen* web server in `vi`.

`vi index.js`{{execute T1}}

**Step 3:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

Let's do a short analysis of code.


Notice the function, `shutdown` at `Lines 17 -33`. This function has the shutdown behavior for the web server. Notice that it sends out advisory messages via `console.log` reporting that server is shutting down. Then after the advisory information is transmitted, the actual `process.exit(0)` command is executed at `Line 28`.

Granted, the current behavior in the function, `shutdown` is trivial and we readily admit that using `console.log` is not the best way to log application data. Rather a logging framework that sends log data to stdout as well as central log collector should be used. In fact you'll learn about the importance of consistent, comprehensive logging when we look at the Logging principle of 12 Factor App.

But putting the anti-pattern of `console.log` aside for a moment, the function, `shutdown` does serve as a good example of centralizing web server shutdown o a place where more comprehensive termination behavior can be implemented.

**Step 5:** Let's examine the lines of code that capture the shutdown execution interruption signals coming in to the web server.

`:56`{{execute}}

This code is very specific to Node.js. The code is capturing execution interruption events using the the `process` object. This is happening at `Line 48` and `Line 52`.

The thing to keep in mind is that most, if not all, programming languages have a way to capture execution interruption signals. But, the way that execution interruption is captured can vary by programming language.

The important thing to understand that the code does indeed capture execution interruption and has a mechanism to respond with graceful termination of the service. This mechanism is the function, `shutdown`.

Remember, graceful termination is a key aspect of the Disposability principle of 12 Factor App.


**Step 6:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 7:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

---

**Congratuations!** You've completed the lab.