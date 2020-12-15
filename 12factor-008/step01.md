## Objective
The objective of this lesson is to demonstrate how to clone the lab code from GitHub into the Innovation In Software interactive learning environment on Katacoda.

## Steps

**Step 1:** Get the code from GitHub:

`cd ~/ && git clone https://github.com/innovationinsoftware/12factor.git`{{execute}}

**Step 2:** Navigate to the working directory of the code just cloned. This directory contains all the assets for the lab's demonstration application.

`cd ~/12factor && pwd`{{execute}}

You have cloned the code for this lab and have navigated to the working directory of the lab's demonstration application. 

**Step :** Confirm Kubernetes is up and running and the nodes are accessible

`kubectl get nodes`{{execute}}

---

***Next: Getting the code up and running***