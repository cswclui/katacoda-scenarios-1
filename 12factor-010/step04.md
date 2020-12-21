## Objective
The objective of this lesson is to create the two Jenkins pipeline jobs that are a demonstration of the Dev-Prod Parity principle of 12 Factor App.

In this lesson, to create the pipeline jobs, we're going to go into the instance of Jenkins we installed in the Katacoda interactive learning environment.

As mentioned above, the steps in this lesson will be executed direcly in the Jenkins. We've embedded a video in this lesson that shows the steps involved.

## Steps

**Step 1:** Click the linke below to go to the instance of Jenkins running in the Katacoda interactive learning environment.

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com

**Step 2:** Once you're in the Jenkins web page, view the video below and then follow the steps demonstrated.

[VIDEO]

As you can see from the video demonstration, both versions of *Secret Society* run in nearly identical deployment processes. But, due to the configuration settings that ship with each version we get different b behaviors.

When it comes time to move `V2` of *Secret Society* , at the most basic level, all that's required is to create a new branch destined to the `staging` and then `production` environments. All that's required in the new branch is to adjust the deployment target destination in the new branch's `Jenkinsfile`.

---

**Congratuations!** You've completed the lab.