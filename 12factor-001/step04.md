## Objective
The objective of this lesson is to examine code for the lab's demonstration application. 

The demonstration application is named, *Pinger*. The purpose of Pinger is to report information about the environment in which it is running. Pinger runs as a webserver.

Pinger is not very useful in its current version. We're going to "grow" Pinger over the course of a few labs as we demonstrate each of the twelve principles of 12 Factor App.

## Steps


**Step 1:** Confirm you are in the working directory of the lab's application.

`pwd`{{execute}}

You should see the following output:

`/root/12factor-001`

If you are not in that working director, execute the following command: `cd /root/12factor-001`{{execute}}.

**Step 2:** Open the application code in the `vi` editor.

`vi server.js`{{execute}}

**Step 3:** Turn on line numbering in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq}}

and then enter:

`:`{{execute}}

finally, enter: 

`set number`{{execute}}

You will see current version of the Pinger code, which is written in Node.JS, in the `vi` editor with line numbers showing.

---

***Next: Viewing the Application's Configuration File**