## Objective
The objective of this lesson is to develop an understanding of the benefit of using the [Build, Release Run](https://12factor.net/build-release-run) principle of 12 Factor App in order to make it so you can build your application from the source repository and deploy it in a consistent manner that scales.

In this lab we're going to ....

But, before we do, we need to install Jenkins in Katacoda. Jenkins is the release platform we're gong to use to demonstrate the principle of Build, Release Run. 


## Steps

**Step 1:** Navigate back to the the lesson's working directory.

`cd /root/12factor && pwd`{{execute}}

You should see the following output:

`/root/12factor`

**Step 2:** Check out the `git` branch that contains the source code for this lesson:

`5-build-release-run.0.0.1`{{execute}}

You'll see output as follows:

```
Branch '5-build-release-run.0.0.1' set up to track remote branch '5-build-release-run.0.0.1' from 'origin'.
Switched to a new branch '5-build-release-run.0.0.1'

```

Next we're going to install Jenkins using a special version designed especially for this lesson.


## Summary

----


***Next: Understanding the Benefit of Build, Release, Run"***