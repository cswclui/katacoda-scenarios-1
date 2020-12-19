## Objective
The objective of this lesson is to view the web server code for the *Burger Queen* service to analyze how the service support the Disposability principle of 12 Factor App.

**NOTE:** Although the code for the *Burger Queen* service is written in Node.js, general way that graceful shutdown is accomplished can be implemented in any language.

## Steps

**Step 1:** Confirm you are in the working direcotyr for the *Burger Queen* service.

`cd /root/12factor/burgerqueen && pwd`{{execute T1}}

You should see the following output:

`/root/12factor/burgerqueen`

**Step 2:** Open the source code for the *Burger Queen* web server in `vi`.

`vi .index.js`{{execute T1}}}

**Step 3:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

Let's do a short analysis of code.


[DISCUSSON]

**Step 4:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 5:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

---

**Congratuations!** You've completed the lab.