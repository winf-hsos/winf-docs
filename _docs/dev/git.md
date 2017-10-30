---
title: Git
subtitle: Enables Team Coding
layout: doc
---

# Why use git? 

*Git* is open source software to manage different versions of files. In particular, we use it to manage different versions of programming code. Developers benefit especially when working in teams, as Git provides workflows for checking in code versions in a common code repository that is accessed by every team member. Such a central repository is called a *Git repository*.

A prominent Git repositroy provider is [Github](https://github.com/){:target="_blank"}. Github is an online platform and provides public repositories for free. You only need to [sign up](https://github.com/join){:target="_blank"} for an account and you can start using it. 

This video gives you a nice introduction to Github and what it does.

<iframe width="400" height="250" src="https://www.youtube.com/embed/w3jLJU7DT5E?rel=0" frameborder="0" allowfullscreen></iframe>
 
# How to get Git

You need to install the Git command line interface (CLI) to use Git on your computer. If you are using [Cloud9](https://c9.io/){:target="_blank"}, Git is already installed in your workspace. Since we are using Cloud9 for all programming tasks within our classes, you're good to go. If you want to use Git outside of Cloud9, you can download the CLI for all major operating systems here:

- [Downlod Git for Linux, Mac OS X, Windows, and Solaris](https://git-scm.com/downloads){:target="_blank"}

# Checkout code from a repository

If your are using Git for our classes, code examples are provided in a Github repository. For example the code for the Web Engineering class is accessible [here](https://github.com/winf-hsos/webengineering){:target="_blank"}. To check out, i.e. download the code to your computer or Cloud9 workspace, follow these steps:

1. Create a folder where you want save the local copy of the repository. For example `mkdir myrepo`
2. Change to that new folder with `cd myrepo`
3. From within that new folder, type `git clone https://github.com/winf-hsos/webengineering.git`

Git will now download the remote repository from Github to your local workspace. Check if everything is there with `ls`. In your directory `myrepo` should now be a subdirectory `webengineering` containing all the code for the class.

On the official Git website, there is a great book on Git that you can read for free. The following link takes you the chapter about getting code from a Git repository. It is worth reading, as it covers almost anything you need to know about Git for our classes:

- [Getting a Git Repository](https://git-scm.com/book/id/v2/Git-Basics-Getting-a-Git-Repository){:target="_blank"}

# Start tracking new files

Use `git add [file]` to add a new file to version control. By default, creating a new file won't add the file to version control. You have to do it manually using the Git CLI. The following line add the file `index.html` in your current directory to the git repository:

`git add index.html`

If you want to add all untracked files, you can simply use:

`git add .`

# Staging changes

When you modify a file, Git recognizes this and it will list the file as *unstaged* when you type `git status`. In order to submit the changes to the repository to share with your team, you must first stage them. Once again, you use 

`git add index.html`

for that (if you modified `index.html`). You can also use

`git add .`

to stage all files with changes. All staged files wil be included in your next commit.

# Commiting changes

Now that you have put all your modified files in the stage area (or all files you want to actually submit to the repository), you are ready to commit all changes. You can use

`git commit -m 'My explanatory commit message'`

for that. If you don't want to stage your files first, you can avoid this altogether with the following shortcut:

`git commit -a -m 'No staging, directly commited everything'`

This is probably what you want most of the time, as the staging area is useful for many use cases, but sometimes too much for small projects.

# Push your code to the remote repository

 `git push origin master`

# Check the status of your files

If you need an overview of untracked files as well as files with changes, you can use `git status`. The following is the output when nothing needs to be done, i.e. the remote repository is in sync with your local work.

```
git status
On branch master
nothing to commit, working directory clean
```