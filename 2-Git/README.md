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
