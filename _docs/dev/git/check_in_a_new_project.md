---
title: How to Check in a new Project
layout: doc
---

In many classes, we produce code. In some cases, that code needs to be reviewed and graded, for example in Web Engineering where it is part of your group project's result. As a platform to share and manage code, we use [GitHub](https://github.com){:target="_blank"}. GitHub enables us to *check-in* code and make it publicly available. In the following, I describe the steps you need to take to initially check in your code.

## 1. Create Your GitHub Account

If not already done, [create your own account](https://github.com/join?source=header-home){:target="_blank"} using your university's e-mail address. 

## 2. Create a New Repository

You can create a new repository when you click the plus symbol on the upper right and select "New repository". Make sure you are giving it the right name. Depending on the class, use the following names:

- Web Engineering & E-Commerce: **hsos-web**
- Impacts of Digitalization: **hsos-iod**

Fill the description field with something that indicated which group this repository belongs to, and which class and semester. You can copy this and simply replace the necessary information: 

- Repository for <**group**> (<**class**>&nbsp;&nbsp;<**semester**>)

Make the repository **public** and do not initialize with a README. Click "Create repository".

![screenshot](/img/docs/github_new_repo.png "Create a new repository in GitHub")

## 3. Initialize a Git Repository for Your Project

Go to Cloud9 (or where your code sits) and open a terminal window. Change to the "master" folder where your code is waiting for check-in. You should always have a folder named "master" in your workspace where you copy the latest version of your group's work when it is due to check-in.

Now, enter the following:

```git init```

Git, which comes pre-installed with Clou9, has now initialized a new repository.

## 4. Add Files to Git and Commit

Next, you have to tell Git which files to keep track of. This does the trick:

```git add .```

The `.` tells Git to add all files. Now, commit the files:

```git commit -m "Inital commit of group work"```

This command stages the files and puts a message on them. Now, we are only one step away from our goal.

## 5. Push the Files to GitHub

You have prepared everything in Cloud9 and you are now ready to send the files over the internet to GitHub. We first must tell git where to push the files to. For this, we need the repository's URL. You can get the URL on your GitHub website, it looks like this:

```https://github.com/<user>/<reponame>.git```

Replace your URL in the following command:

```git remote add origin https://github.com/<user>/<reponame>.git```

Finally, push:

```git push -u origin master```

Git will ask for your username and password. After you have input them, the files will be pushed to your GitHub repository. Check this by refreshing your GitHub repo page.

Don't forget to post the link to your GitHub repository to your group's channel on Slack!





