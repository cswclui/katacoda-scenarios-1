## Objective
The objective of this lesson is demonstrate how to demonstrate the principle Dev-Prod Parity by looking that the script and configuration settings two version of the demonstration application, *Secret Society*.

The second version of *Secret Society* has a new feature that will report some new data. However, except for the new data, the build, run and release processes for both versions of demonstration application are nearly identical. The same process is used to get process from source control all they through the CI/CD process to a target runtime environment.

## Steps

**Step 1:** Navigate back to the lesson's working directory.

`cd /root/12factor && pwd`{{execute}}

You should see the following output:

`/root/12factor`

Let's examine the Jenkinsfile script for the first pipeline job. First we, need to go to the GitHub branch for the first version of the demonstration application, *Secret Society*.

**Step 2:**`git checkout 10-dev-prod-parity.0.0.1`{{execute}}

You'll get the following output:

```
Switched to branch '10-dev-prod-parity.0.0.1'
Your branch is up to date with 'origin/10-dev-prod-parity.0.0.1'.

```

Now, we'll open the `vi` editor to examine the contents of the `Jenkinsfile`.

**Step 3:** `vi Jenkinsfile`{{execute}}

**Step 4:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

[DISCUSSION]

**Step 5:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 6:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

Let's compare what we've just examined in the first `Jenkinfile` to the the next version intended for release. We need to check out the second GitHub branch that has the source code fdor the Version 2 of *Secret Society*

**Step 7:**`git checkout 10-dev-prod-parity.0.0.2`{{execute}}

You'll get the following output:

```
Switched to branch '10-dev-prod-parity.0.0.2'
Your branch is up to date with 'origin/10-dev-prod-parity.0.0.2'.

```

Now, we'll open the `vi` editor to examine the contents of the `Jenkinsfile`.

**Step 8:** `vi Jenkinsfile`{{execute}}

**Step 9:** Turn on the line numbering features in `vi`.

Press the ESC key: `^ESC`{{execute ctrl-seq T1}}}

and then enter:

`:set number`{{execute T1}}}

[DISCUSSION]

**Step 10:** Get out of `vi` line numbered view mode

Press the ESC key: `^ESC`{{execute ctrl-seq}}

**Step 11:** Exit `vi`

`:q!`{{execute}}

You have exited `vi`.

## Summary
TBP

---

***Next: Implementing Dev-Prod Parity Under Jenkins***