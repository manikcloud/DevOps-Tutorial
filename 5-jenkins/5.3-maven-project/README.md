


## Copy & paste this commands in your Jenkins, build option, execute shell 

```
cd 5-jenkins/5.3-maven-project/my-app

mvn clean install

tree

java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App

```