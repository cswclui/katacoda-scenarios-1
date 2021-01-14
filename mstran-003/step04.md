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

`vi scheduler/dataManager/index.js`{{execute T1}}

**Step 3:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

and then enter:

`:set number`{{execute T1}}

**Step 4:** Take a look at the function, `createScheduleItem` at `Line 55`:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

`:55`{{execute T1}}

You'll see the following code:

```

const createScheduleItem = async (ScheduleItem) => {
    const period = ScheduleItem.period || '* * * * * *'; //every second is the default
    const itm = parseSchedulerItemToSendItemSync(ScheduleItem);
    const job = new CronJob(period, async function () {
        console.log({postingToSender: itm, time: new Date().toString()});
        await postToSender(itm);
        console.log({postedToSender: itm, time: new Date().toString()});
    }, null, true, 'America/Los_Angeles');
    job.start();
    return itm;
};

```

This is the code that creates the `CronJob` for each user. The `CronJob` is the mechanism that sends a `fortune` to the `user` associated with the `CronJob`.

The line of code that actually sends a fortune to a `target` can be found at `Line 56`. The function `postToSender` is the function that sends a `fortune`. Let's take a look at the function, `postToSender`.

**Step 5:** Go to the function, `postToSender` at `Line 29`:

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}

`:55`{{execute T1}}

You'll see the code as follows:

```
const postToSender = async (scheduleItem) => {
    const url = getDependencyApiUrl('SENDER');
    const res = await axios.post(url, scheduleItem);
    if (res.status >= 400) {
        throw new Error({status: res.status, message: res.message});
    }
};

```

The function `getDependencyApiUrl` is the logic that discovers the URL of the particular microservice that is target to receiver a `fortune`, for example `SMS` or `Facebook` or `Twitter`.

The code ...

` const res = await axios.post(url, scheduleItem)`

... uses the [`axios`](https://github.com/axios/axios) HTTP client library to send a `scheduleItem` to the `sender`.

**Step 6:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 7:** Exit `vi`

`:q!`{{execute T1}}

You have exited `vi`.

## Summary

Whereas in the monolithic version of *Fortune Cookies* in the last scenario `scheduler` had direct access to the `sender` code to transmit `fortunes` to the intended targets, all that `scheduler` knows about `sender` in this version is that it exists at a `URL` on the network. Communication to `sender` takes place via a synchronous HTTP request.

In this case, the URL for `sender` as well as the URLs for the other microservices for *Fortune Cookies* are declared in the Kubernetes manifest files that describe the configuration of the given pod that has the containers the represent the microservice. (You can view the manifest files for both the pod and service of the *Fortune Cookies* MOA [here](https://github.com/reselbob/fortune-cookies/tree/master/microservice-sync/kubernetes/manifests).)

For example, the following YAML code describes configuration settings the the `scheduler` pod:

```
---
apiVersion: v1
kind: Pod
metadata:
  name: scheduler
  labels:
    app: scheduler
spec:
  containers:
  - name: scheduler
    image: localhost:5000/scheduler
    imagePullPolicy: Always
    ports:
      - name: app
        containerPort: 3000
    env:
      - name: SENDER_API_URL
        value: "http://sender/"
```

Notice that the URL for `sender` is defined at the bottom of the YAML file in the environment variable, `SENDER_API_URL` as shown above.

Separating microservices into standalone locations on the network that are accessible by a URL over HTTP is the essential principle driving synchronous microservice oriented applications.

The benefit separating microservices in to distinct locations on the network is that change becomes easier to manage. For example, should behavior in `scheduler` need to be changed, the boundary of code change is confined to the `scheduler` microservice only. No other code needs to be changed. No other code needs to be deployed. All change is confined to the `scheduler` microservice.

---

**Congratuations!** You've completed the lab.