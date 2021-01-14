## Objective
The objective of this lesson is examine that demonstration service, *Fortune Cookies* in order to understand the the monolithic nature of the service.

## Steps

**Step 1:** Take a look at the file and directory structure for the monolithic version of *Fortune Cookies*:

`tree -L 1`{{execute T1}}

You'll get the following output:

```
.
├── architecture.md
├── Dockerfile
├── fortunes
├── images
├── package.json
├── README.md
├── scheduler
├── sender
├── server.js
├── test
└── users

```

The illustration below describes purpose of each of the components in the monolith.

![logo](mstran-002/assets/basic-architecture-components.png)

Each component in the monolithic version of *Fortune Cookies* is well known internally within the application. One component can call another using a Javascript `require` statement. In order to use `require`, the code needs to know the exact location of the source code for the given component of interest. If a file gets deleted or a reference is wrong, the code will fail.

Let's take a look at the implication:

**Step 2:** Open the source code for the `scheuler` component in the `vi` editor:

`vi scheduler/index.js`{{execute T1}}

**Step 3:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

Notice the code at `Line 4`:

`const {send} = require('../sender/index.js'):`

The Javascript code shown above is the way Node.js imports a function from another internal module. In this case, the function `send` is imported.

**Step 4:** Go to `Line 21`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

`:21`{{execute T1}}}

The code:

`send(config, obj.fortune);`

executes the `send` function within the construction of the `CronJob` that fires off sending a *Fortune Cookies* at the prescribed interval.

The important thing to understand is that the since the `sender` module is part of the overall source code for *Fortune Cookies*, any update in `send` behavior require a deployment of the entire *Fortune Cookies* source code. You just can't update `send` independently.

The same is true of the `getUsersSync` function which is imported at `Line 3` at the beginning of the code.

**Step 5:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 6:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

## Summary

As you can see this monolithic version of *Fortune Cookies* while operational is hard to scale. Changing any code requires a completely new deployment of the entire code base.

Tranforming this monolithic version into a microservice oriented application (MOA) in which each component is an independent service addresses this shortcoming.

We'll take a look at two ways of implementing *Fortune Cookies* as an MOA. One way is to take a synchronous approach. The other way is to do an asynchronous implementation.

---

**Congratuations!** You've completed the lab.