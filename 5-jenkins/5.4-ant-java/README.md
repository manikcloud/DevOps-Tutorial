# Hello World Java Program with Ant on Linux

## Introduction
This tutorial guides you through creating and running a simple "Hello World" Java program using Apache Ant on a Linux system.

## Prerequisites
- Java Development Kit (JDK)
- Apache Ant

Ensure both are installed on your system. You can verify by running `java -version` and `ant -version` in your terminal.

## Setup

### Step 1: Project Structure
Create a project directory and set up the following structure:



Navigate to your project directory:
```bash
mkdir HelloWorldAnt
cd HelloWorldAnt
```

- Step 2: Java Source File
Inside the src directory, create a file HelloWorld.java:



```
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
```
- Step 3: Ant Build File
Create build.xml at the root of your project with the following content:

```
<project name="HelloWorld" default="run">
    <target name="compile">
        <mkdir dir="bin"/>
        <javac srcdir="src" destdir="bin"/>
    </target>

    <target name="run" depends="compile">
        <java classname="HelloWorld" classpath="bin"/>
    </target>
</project>

```


- Running the Program
To build and run your program, execute:

```
ant run
```

You should see Hello, World! printed in the console.