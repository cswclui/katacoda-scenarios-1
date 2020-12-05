## Objective
The objective of this lesson is to examine code for the lab's demonstration application. 

The demonstration application is named, *Pinger*. The purpose of Pinger is to report information about the environment in which it is running. Pinger runs as a webserver.

Pinger is not very useful in its current version. We're going to "grow" Pinger over the course of a few labs as we demonstrate each of the twelve principles of 12 Factor App.

## Steps to Access the Application Code


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

`:set number`{{execute}}


You will see current version of the Pinger code, which is written in Node.JS, in the `vi` editor with line numbers showing.

## Discussion of Application

This code for the demonstration application is Javascript that runs under [Node.js](https://nodejs.org/en/about/).

The code at lines 1 - 4 binds the external dependencies to the application code. Lines 7 -  17 is the Javascript function, `handleRequest` that accepts the HTTP `request` coming in from the internet. The function creates a simple HTTP `response` that returns a JSON object that reports the name of the application as well as the current time.

Line 19 is the intelligence that creates the actual web server using [`http.createServer`](https://nodejs.org/dist/latest-v14.x/docs/api/http.html#http_http_createserver_options_requestlistener). The request handler function, `handleRequest` is passed to `createServer()` as a parameter.

The server binds to the port at line xx

---

***Next: Viewing the Application's Configuration File**