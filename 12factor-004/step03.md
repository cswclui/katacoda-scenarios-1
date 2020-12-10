## Objective
The objective of this lesson is to bind the demonstration application to the Backing Service created in the last lesson.

In the previous lesson you examined the source code for *Pinger's* web server. You'll have noticed the the code as using a `logger` to keep a record of requests comming into *Pinger*.

In this lesson we'll look at the details of the the logger as well as the environment configuration settings that binds *Pinger* to the backing service *Collector*. *Collector* is the backing service to which the logger binds.


## Steps

**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor`

If the working directory is not `/root/12factor`, execute the following command:

`cd /root/12factor`{{execute T1}}

**Step 2:** Open the the logger's source code in `vi`.

`vi ./pinger/logger/index.js`{{execute}}

**Step 3:** Turn on the line numbering the `vi` editor:

Press the ESC key: `^ESC`{{execute ctrl-seq}}

and then enter:

`:set number`{{execute}}

**Step 6:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 7:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

## Summary

---

**Congratuations!** You've complete the lab




