## Objective
The objective of this lesson is demonstrate how to increase pod allocation in the Kubernetes cluster in which the demonstration application *Food Court* is running according the process type of services in the application.

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute T1}}

You should see the following output:

`/root/12factor`

**Step 2:** Take a look at the current allocation of pods in the various deployments.

`kubectl get deployment`{{execute T1}}

You'll see out put similar to the following:

```
TBP

```

[DISCUSSION]

**Step 3:** Change the the number of pods assigned to each deployment to accommodate the stress points we described above

`cd k8s && sh update-k8s-deployments.sh`{{execute T1}}

You get out put simlar to the following:

```

deployment.apps/collector-deployment configured
deployment.apps/customer-deployment configured
deployment.apps/hobos-deployment configured

```

**Step 4:** Take a look at the news allocation of pods in the various deployments.

`kubectl get deployment`{{execute T1}}

You get out put simlar to the following:

```

burgerqueen-deployment   1/1     1            1           3m42s
collector-deployment     2/2     2            2           3m42s
customer-deployment      3/3     3            3           3m41s
hobos-deployment         4/4     4            4           3m41s
iowafried-deployment     1/1     1            1           3m41s
redis-deployment         1/1     1            1           3m40s

```

[DISCUSSION]

---

**Congratuations!** You've completed the lab.