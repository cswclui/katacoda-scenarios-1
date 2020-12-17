## Objective
The objective of this lesson is demonstrate how to increase pod allocation in the Kubernetes cluster in which the demonstration application *Food Court* is running.

## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute T1}}

You should see the following output:

`/root/12factor`

**Step 2:** Take a look at the current allocation of pods in the various deployments.

`kubectl get deployment`{{execute T1}}

You'll see out put similar to the following:

```
NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
burgerqueen-deployment   1/1     1            1           2m3s
collector-deployment     1/1     1            1           2m2s
customer-deployment      1/1     1            1           2m2s
hobos-deployment         1/1     1            1           2m1s
iowafried-deployment     1/1     1            1           2m1s
redis-deployment         1/1     1            1           2m

```

As we discusses in the last lesson, we imagined a situation in which the processes that are represented by pods in the Kubernetes cluster under which became subject increases stress, but the level of stress varied among components. In this case, because we are supporting the Concurrency principle of 12 Factor App, we can increase the number of pods for each affected service independently.

We'll do this by taking advantage of the a feature in Kubernetes deployments that supports increaseing number number of pods under s deployment by doing nothing more than increasing the value assigned to `replicas` atttribute in the given deployment manifest `yaml` file.

In this case, we're going to increase the number of pods associated with the `collector` service from `1` to `2`.

**Step 3:** View the actual manifest file that will instigate the pod allocation for `collector` by executing the following command:

`clear && cat k8s/manifests/collector-deployment-update.yaml`{{execute T1}}

We'll increase the number of pods associated with the `customer` service from `1` to `3`.

**Step 4:** View the manifest file that will instigate the pod allocation for `customer` by executing the following command:

`clear && cat k8s/manifests/customer-deployment-update.yaml`{{execute T1}}

We'll increase the number of pods associated with the `hobos` service from `1` to `4`.

**Step 5:** View the manifest file that will instigate the pod allocatin for `hobos ` by executing the following command:

`clear && cat k8s/manifests/hobos-deployment-update.yaml`{{execute T1}}

Now, let's do the update using the bash script that's part of this lesson.

**Step 6:** Change the the number of pods assigned to each deployment to accommodate the stress points we described above

`cd k8s && sh update-k8s-deployments.sh`{{execute T1}}

You get out put simlar to the following:

```
deployment.apps/collector-deployment configured
deployment.apps/customer-deployment configured
deployment.apps/hobos-deployment configured

```

**Step 7:** Take a look at the news allocation of pods in the various deployments.

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

As you can see the component allocations have been updated as expected.

---

**Congratuations!** You've completed the lab.