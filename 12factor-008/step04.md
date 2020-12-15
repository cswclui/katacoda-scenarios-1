## Objective
The objective of this lesson is demonstrate how to increase pod allocation in the Kubernetes cluster in which the demonstration application *Food Court* is running according the process type of services in the application.

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute T1}}

You should see the following output:

`/root/12factor`

**Step 2:** Take a look at the current allocation of pods in the various deployments.

`kubectl get deployment`{{execute T1}}

[DISCUSSION]

**Step 3:** Change the the number of pods assigned to each deployment to accommodate the stress points we described above

`sh update-k8s-deployments.sh`{{execite T1}}

You get out put simlar to the following:

```

TBP

```

**Step 4:** Take a look at the news allocation of pods in the various deployments.

`kubectl get deployment`{{execute T1}}

You get out put simlar to the following:

```

TBP

```

[DISCUSSION]

---

**Congratuations!** You've completed the lab.