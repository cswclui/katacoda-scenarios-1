## Objective
The objective of this lesson analyze the synchronous version of MOA *Fortune Cookies* in order understand ow to develop a microservice oriented application that exposes each microservice in the application as a RESTful API.

The underlying principle of this version of *Fortune Cookies* is that each component runs and an independent service runniing under Kubernetes as accessible via a RESTful API.

![Architecture](mstran-003/assets/sync-arch.png)

The keys to understanding how this microservice architeccture works is to take a look at how one service interacts with another and then inspecting the configuration file that binds services together.

First let's look at how the `scheduler` service calls the `sender` service.

## Steps

**Step 1:** Go to the working directory for the `microservice-sync` source code

`clear &&  cd ~/fortune-cookies/microservice-sync && pwd`{{execute T1}}

**Step 2:** Open the source code for `scheduler` in the `vi` editor.

`vi microservice-sync/scheduler/dataManager/index.js`{{execute T1}}

**Step 3:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T1}}

---

**Congratuations!** You've completed the lab.