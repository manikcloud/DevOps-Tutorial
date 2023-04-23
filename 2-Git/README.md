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