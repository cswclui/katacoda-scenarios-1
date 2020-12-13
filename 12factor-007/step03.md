## Objective
The objective of this lesson is analyze the source code and configuration files to discover how these element comply with the 12 Factor App principle of [Port Binding](https://12factor.net/port-binding).

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute T1}}

You should see the following output:

`/root/12factor`

**Step 2:** Take a look at the `customer` source code in `vi`.

`vi ./customer/index.js`{{execute T1}}}

**Step 3:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

**Step 4:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 5:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

**Step 6:** Take a look at the source code for the restaurant `burgerqueen` in `vi`.

`vi ./burgerqueen/index.js`{{execute T1}}}

**Step 7:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

**Step 8:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step y:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

---

***Next: Binding to services by port number***