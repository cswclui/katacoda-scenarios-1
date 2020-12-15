## Objective
The objective of this lesson is to demonstrate how to clone the lab code from GitHub into the Innovation In Software interactive learning environment on Katacoda.

## Steps

**Step 1:** Start minikube

`minikube start`{{execute T1}}

**Step 2:** In a second terminal window, turn on minikube Load Balancing

`minikube tunnel`{{execute T2}}

**Step 3:** Get the code from GitHub:

`cd ~/ && git clone https://github.com/innovationinsoftware/12factor.git`{{execute T1}}

**Step 4:** Navigate to the working directory of the code just cloned. This directory contains all the assets for the lab's demonstration application.

`cd ~/12factor && pwd`{{execute T1}}

You have cloned the code for this lab and have navigated to the working directory of the lab's demonstration application. 

**Step 5:** Confirm Kubernetes is up and running and the nodes are accessible

`kubectl get nodes`{{execute T1}}

---

***Next: Getting the code up and running***