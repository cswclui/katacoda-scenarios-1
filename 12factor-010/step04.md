## Objective
The objective of this lesson is to create the two Jenkins pipeline jobs that are a demonstration of the Dev-Prod Parity principle of 12 Factor App.

In this lesson, to create the pipeline jobs, we're going to go into the instance of Jenkins we installed in the Katacoda interactive learning environment.

As mentioned above, the steps in this lesson will be executed direcly in the Jenkins. We've embedded a video in this lesson that shows the steps involved.

## Steps

**Step 1:** Click the link below to go to the instance of Jenkins running in the Katacoda interactive learning environment that you created in the earlier step.

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com

Once you're in the Jenkins web page, you're going to create 2 Pipeline jobs in Jenkins.

One job, which will have the title, `secret_society_v1` will bind the source code repository on GitHub. This is the common repository for all work done on the demonstration application. (**Reminder:** [Codebase](https://12factor.net/) is the first principle of 12 Factor App.) The URL for the source code repository is `https://github.com/innovationinsoftware/12factor.git`. Also, the pipeline job will bind to the branch in the GitHub repository that has the source cdoe for the `V1` version of *Secrety Society*. The name of this branch is `10-dev-prod-parity.0.0.1`

The title of the second pipeline job is `secret_society_v2`. The second pipeline job will bind the the same source code repository in GitHub as the first pipeline job. However, the second pipeline job, `secret_society_v2` will bind to the branch `10-dev-prod-parity.0.0.2`. This branch has the source code for the `V2` version of *Secrety Society*.

You'll run each job to get a sense of how parallel deplopyments work. You'll notice that the process for deploying *Secrety Society* is identical in each Jenkins pipeline job. The difference between jobs is determined by the configuration settings defined the `Jenkinsfile` and `docker-compose.yaml` files in each branch. This pattern of parallel deployments is the essence of Dev-Prod Parity.

The video shown below describes the tasks that need to be done in Jenkins in order to create the two pipeline jobs.

<iframe width="560" height="315" src="https://www.youtube.com/embed/ZSC6In58uJQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Summary

As you can see from the video demonstration, both versions of *Secret Society* run in nearly identical deployment processes. But, due to the configuration settings that ship with each version we get different b behaviors.

When it comes time to move `V2` of *Secret Society* , at the most basic level, all that's required is to create a new branch destined to the `staging` and then `production` environments. All that's required in the new branch is to adjust the deployment target destination in the new branch's `Jenkinsfile`.

---

**Congratuations!** You've completed the lab.