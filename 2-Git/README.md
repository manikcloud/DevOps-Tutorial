# Version Control System

## Introduction

Version control systems (VCS) are essential tools for tracking changes in software projects, allowing you to maintain a complete history of modifications made to your codebase. This enables developers to easily collaborate, track progress, and revert changes if needed.

## Working with Git

Git is a popular distributed version control system designed for handling projects of all sizes with speed and efficiency. It is widely used by developers around the world and has become the de facto standard for version control.

### Unassisted Practice: Install Git on Linux

To install Git on a Linux system, follow these steps:

1. Open a terminal.
2. Update the package list by running:

```
sudo apt update
```
3. Install Git with the following command:


```
sudo apt install git
```

4. Verify the installation by checking the Git version:

```
git --version

```

5. Configure your Git username and email:

```
git config --global user.name "Your Name"

git config --global user.email "youremail@example.com"

```

You have now successfully installed Git on your Linux system.

# Part 2

## GitHub as an SCM Tool

GitHub is a web-based platform for version control and collaboration using Git. It provides a simple and user-friendly interface for managing and collaborating on software projects.

### Assisted Practice: Create and Clone a GitHub Repository

1. Sign up for a GitHub account or sign in to your existing account.
2. Click on the "+" icon in the upper-right corner, and select "New repository."
3. Enter a repository name, add an optional description, choose visibility (public or private), and click "Create repository."
4. Copy the repository URL from the "Quick setup" section.
5. On your local machine, open a terminal and navigate to the directory where you want to clone the repository.
6. Run the following command to clone the repository:

```
git clone [repository URL]
```

You have now created a GitHub repository and cloned it to your local machine.

## Fork, Push, and Pull in Git

### Assisted Practice: Create a Pull Request in Git

1. Fork a repository on GitHub by clicking the "Fork" button at the top right corner of the repository page.

2. Clone the forked repository to your local machine:

```
git clone [forked repository URL]
```

3. Create a new branch for your changes:

```
git checkout -b [new branch name]
```

4. Make changes to the files and commit them:

```
git add .
git commit -m "Your commit message"
```

5. Push your changes to your forked repository:

```
git push origin [new branch name]
```

6. Go to the original repository on GitHub, and click on the "Pull Requests" tab.

7. Click on the "New Pull Request" button, and choose the branch you just pushed from your forked repository.

8. Review your changes and click "Create Pull Request."

You have now created a pull request in Git.


# Part 3

### Assisted Practice: Push file to GitHub Repository

1. Navigate to your local repository in the terminal.
2. Create or modify a file in the repository.
3. Stage the changes using:

```
git add [file name]
```
To stage all changes in the repository, use:
```
git add .

```

4. Commit the changes with a meaningful commit message:

```
git commit -m "Your commit message"
```

5. Push the changes to the remote repository on GitHub:

```
git push origin [branch name]
```

Your changes are now pushed to the GitHub repository.

## Branching in Git

Branching allows you to create a separate line of development within a repository, enabling you to work on features or fixes independently from the main branch. This makes it easier to manage and maintain code, especially in large projects with multiple contributors.

### Assisted Practice: Create a Branch in Git

1. Navigate to your local repository in the terminal.
2. Create a new branch with a descriptive name:

```
git checkout -b [new branch name]
```

3. Verify that you have switched to the new branch:

```
git branch
```

You have now created a new branch in Git.

## Switching Branches in Git

Switching branches allows you to move between different lines of development in your repository.

### Assisted Practice: Switching Branches in Git

1. List all branches in your local repository:

```
git branch
```

2. Switch to an existing branch:

```
git checkout [existing branch name]
```

3. Verify that you have switched to the desired branch:

```
git branch
```

You have now successfully switched branches in Git.

## Merging Branches in Git

Merging branches in Git is the process of combining changes from one branch into another. This is commonly done when a feature or fix is completed and ready to be integrated into the main branch.

### Assisted Practice: Merging Branches in Git

1. Ensure that you have committed all changes in the branch you want to merge.
2. Switch to the target branch:

```
git checkout [target branch name]
```

3. Merge the changes from the source branch into the target branch:

```
git merge [source branch name]
```

4. Resolve any merge conflicts if they occur, and commit the changes.
5. Push the updated target branch to the remote repository:

```
git push origin [target branch name]
```

You have now successfully merged branches in Git.

This completes the content for your README.md file on version control systems, Git, and GitHub.


## Using "git switch" Command

The "git switch" command is an alternative way to switch branches in Git, introduced in Git version 2.23.0. It provides a more straightforward and user-friendly method for switching branches compared to the "git checkout" command.

### Assisted Practice: Switching Branches Using "git switch"

1. List all branches in your local repository:

```
git branch
```

2. Switch to an existing branch using the "git switch" command:

```
git switch [existing branch name]
```


3. Verify that you have switched to the desired branch:
```
git branch
```

You have now successfully switched branches using the "git switch" command.

### Creating a New Branch with "git switch"

You can also create a new branch and switch to it using the "git switch" command in a single step:
```
git switch -c [new branch name]
```
This command will create a new branch with the specified name and switch


# SSH Connectivity to your Simplilearn lab VM 

- Step 1 - Loging to github
- Step 2: Create a Repo 
- Step 3 : Click on your user profile and clicl on stetting 
- step 4: Click on ssh key 
- step 4.: Copy and paste your pub key 
- Step 6: Click OK 
- Step 7: Clone your repo 

## create ssh key in your lab vm 

- Step 1: Login to lab VM and open terminal 
- Step 2: runthe following command 

```
ssh-keygen
```
Enter three time to create the public & private key 

- Step 3 : copy the content of you `id_rsa.pub` key 

```
cat ~/.ssh/id_rsa.pub
```
- Step 4 : Paste the content in privious step 6 


# Common error while stting the above steps 

```
git clone git@github.com:sindhugowda1991/java.calculatore-delete.git
Cloning into 'java.calculatore-delete'...
The authenticity of host 'github.com (140.82.114.4)' can't be established.
ECDSA key fingerprint is SHA256:p2QAMXNIC1TJYWeIOttrVc98/R1BUFWu3/LiyKgUfQM.
Are you sure you want to continue connecting (yes/no/[fingerprint])? y
Please type 'yes', 'no' or the fingerprint: y
Please type 'yes', 'no' or the fingerprint: y
Please type 'yes', 'no' or the fingerprint: n
Please type 'yes', 'no' or the fingerprint: y
Please type 'yes', 'no' or the fingerprint: y
Please type 'yes', 'no' or the fingerprint: y
Please type 'yes', 'no' or the fingerprint: y
Please type 'yes', 'no' or the fingerprint: y
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added 'github.com,140.82.114.4' (ECDSA) to the list of known hosts.
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```



# Git Branch Guide

This is a step-by-step guide to help you understand and work with Git branches. Branches are a fundamental feature of Git that allows developers to work on multiple tasks simultaneously without interfering with each other.

## Table of Contents

1. [Purpose of Git Branches](#purpose-of-git-branches)
2. [Creating a Branch](#creating-a-branch)
3. [Switching Between Branches](#switching-between-branches)
4. [Merging Branches](#merging-branches)
5. [Deleting a Branch](#deleting-a-branch)

## Purpose of Git Branches

Git branches allow you to separate different features or bug fixes into their own isolated environments. This makes it easier to manage, test, and collaborate on code without causing conflicts.

## Creating a Branch

To create a new branch, use the following command:

```
git checkout -b <branch_name>
```

This will create a new branch and switch to it.

## Switching Between Branches

To switch between branches, use the following command:

```
git checkout <branch_name>
```

This will switch to the specified branch.

## Merging Branches

To merge one branch into another, first switch to the branch you want to merge into:

```
git checkout <target_branch>
```

Then, use the following command to merge the other branch:

```
git merge <source_branch>
```

This will merge the changes from the source branch into the target branch.

## Deleting a Branch

To delete a branch, use the following command:

```
git branch -d <branch_name>
```

This will delete the specified branch.

## Git Merge, Reset, and Rebase

These operations are used to manipulate the commit history and combine changes from different branches.

### Git Merge

Git merge combines the changes from one branch into another. To perform a merge, follow these steps:

1. Switch to the target branch:

   ```
   git checkout <target_branch>
   ```

2. Merge the source branch into the target branch:

   ```
   git merge <source_branch>
   ```

### Git Reset

Git reset is used to undo commits or move the branch pointer to a different commit. There are three modes: soft, mixed (default), and hard.

1. Soft reset:

   ```
   git reset --soft <commit_hash>
   ```

   This will move the branch pointer to the specified commit, but keep the changes in the staging area.

2. Mixed reset (default):

   ```
   git reset <commit_hash>
   ```

   This will move the branch pointer to the specified commit and unstage the changes.

3. Hard reset:

   ```
   git reset --hard <commit_hash>
   ```

   This will move the branch pointer to the specified commit and discard all changes.

### Git Rebase

Git rebase is used to apply a series of commits from one branch onto another, creating a linear history. To perform a rebase, follow these steps:

1. Switch to the branch that has the commits you want to apply:

   ```
   git checkout <source_branch>
   ```

2. Rebase the source branch onto the target branch:

   ```
   git rebase <target_branch>
   ```

   This will apply the commits from the source branch on top of the target branch.

Note: Be cautious when using `git rebase` as it can rewrite the commit history. It's recommended to use it only on local branches that haven't been pushed to a remote repository.

| Operation | Description                                                                                                   | Usage                                                                                   |
|-----------|---------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Revert    | Creates a new commit that undoes the changes made in a specific commit.                                      | ```                                                                                |
|           |                                                                                                               | git revert <commit_hash>                                                                |
|           |                                                                                                               | ```                                                                                    |
| Reset     | Moves the branch pointer to a specified commit. Can be used in soft, mixed (default), or hard mode.          | Soft reset:                                                                             |
|           |                                                                
