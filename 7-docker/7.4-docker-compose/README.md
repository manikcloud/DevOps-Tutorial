# Lesson 5 Demo 11: Convert an Application Deployment into a Stack

This section will guide you to: 
- Convert an application deployment into a stack using a file named docker-compose.yml

| Feature | Docker Service | Docker Stack |
|---------|----------------|--------------|
| Definition | A Docker Service is the definition of the tasks to execute on the manager or worker nodes. It is a part of Docker Swarm, Docker's built-in orchestration solution. | A Docker Stack is a group of interrelated services that share dependencies, and can be orchestrated and scaled together. A stack effectively encapsulates a multi-service application. |
| Use Case | Docker Services are ideal for deploying the same image across multiple environments. You can adjust the number of replicas for each service based on the environment's requirements. | Docker Stacks are perfect for defining and managing multi-service applications. Stacks allow you to manage all the services of an application with just one file. |
| Scale | Services can be scaled up or down individually. | All services within a stack are scaled together, maintaining the application's functionality. |
| Command | `docker service create` | `docker stack deploy` |

### Step 1: Drain the worker nodes in the swarm cluster to make sure the registry service runs on the manager node
- List all the nodes present in the swarm cluster and ensure that all nodes are in Active state

```
sudo  docker node ls

```

 
**Note**: Copy the HOSTNAME of worker nodes
- Use the following command to drain the worker nodes:

```
sudo  docker node update --availability drain hostname_Worker_Node

```


**Note**: Replace hostname_Worker_Node with the HOSTNAME copied in previous ### Step
 

### Step 2: Start the registry as a service on your swarm

```
sudo  docker service create --name registry --publish published=5000,target=5000 registry:2


```


### Step 3: List the running services to check the status of registry service

```
sudo  docker service ls

```

 

### Step 4: Check if registry service is working with curl

```

curl http://localhost:5000/v2/

```

 

### Step 5: Create a directory for the project

```

mkdir stackdemo
cd stackdemo
 
```



### Step 6: Create a file called app.py in the stackdemo directory
- Use the following command to create a project file:

```

nano app.py

```

 
- Add the following code in the app.py file:

```

from flask import Flask
from redis import Redis

app = Flask(__name__)
redis = Redis(host='redis', port=6379)

@app.route('/')
def hello():
    count = redis.incr('hits')
    return 'Hello World! I have been seen {} times.\n'.format(count)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True) 

```

 
**Note**: Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.

### Step 7: Create a file called requirements.txt
- Use the following command to create and open requirements.txt:

```

nano requirements.txt

```

 
- Add the following text in the requirements.txt file:

```

flask
redis

```

 
**Note**: Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.

### Step 8: Create a file called Dockerfile
- Use the following command to create a Dockerfile:

```

nano Dockerfile

```

 
- Add the following code in the Dockerfile:

```

FROM python:3.4-alpine
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["python", "app.py"]

```

 
**Note**: Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.

### Step 9: Create a file named docker-compose.yml
- Use the following command to create the docker-compose.yml file:

```

nano docker-compose.yml

```

 
- Add the following code in the docker-compose.yml file:

```

version: "3.3"
services:
  web:
    image: 127.0.0.1:5000/stackdemo
    build: .
    ports:
      - "8000:8000"
  redis:
    image: redis:alpine

```

 
**Note**: Press Ctrl+X to exit the editor. Then type Y and press Enter to save the file.

### Step 10: Start the application
- Use the following commands to install docker-compose:

```
sudo  curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	

sudo  chmod +x /usr/local/bin/docker-compose
	docker-compose --version

```


 

- Start docker-compose using the following command:

```
sudo  docker-compose up -d

```

 
 

### Step 11: Use the following commands to check whether the app is running 

```
sudo  docker-compose ps
 
curl http://localhost:8000

```

 

### Step 12: Bring the application down

```
sudo  docker-compose down --volumes
 

```


### Step 13: Push the application to the registry

```
sudo  docker-compose push

```

 

### Step 14: Use the following command to create the stack docker stack deploy:

```
sudo  docker stack deploy --compose-file docker-compose.yml stackdemo

```

 

### Step 15: Check if the stack is running

```
sudo  docker stack services stackdemo

```

 

### Step 16: Test the app again with curl command

```

curl http://localhost:8000
curl http://ip-172-31-26-147:8000

```

**Note**: In ### Step 10 while starting docker-compose if you get an error showing the port is already assigned, run the command 

```
sudo  docker ps and kill the container with the same port and then proceed.

```

 

### Step 17: Use the following command to bring the stack down:

```
sudo  docker stack rm stackdemo

```

-----------------------------------------------------------------

# Lesson 5 Demo 12: Increase Number of Replicas

This section will guide you to: 
-	Increase the number of replicas of a task for any given service

### Step 1: List the Docker services

```
sudo docker service ls
``` 

### Step 2: Scale up the redis service to five tasks

```
sudo docker service scale redis=5
 ```

### Step 3: Scale the registry service to four tasks using update flag

```
sudo docker service update --replicas=4 registry
 ```

### Step 4: Use the scale flag to scale both redis and registry services at the same time

```
sudo docker service scale redis=4 registry=3
 ```

### Step 5: Check the actual number of replicas created

```
sudo docker service ls
 ```

### Step 6: Create a global service and scale it up to ten tasks

```
sudo docker service create --mode global --name nginx nginx:latest
 

sudo docker service scale nginx=10
```
 
**Note**: Notice that the scaling cannot be used with global services. It can only be done with replicated service.


# Disclaimer
<details>

Please **Note** that the entire repository is owned and maintained by [Varun Kumar Manik](https://www.linkedin.com/in/vkmanik/). While every effort has been made to ensure the accuracy and reliability of the information and resources provided in this repository, Varun Kumar Manik takes full responsibility for any errors or inaccuracies that may be present.

Simplilearn is not responsible for the content or materials provided in this repository and disclaims all liability for any issues, misunderstandings, or claims that may arise from the use of the information or materials provided. By using this repository, you acknowledge that Varun Kumar Manik is solely accountable for its content, and you agree to hold Simplilearn harmless from any claims or liabilities that may arise as a result of your use or reliance on the information provided herein.

It is important to understand that this repository contains educational materials for a training course, and users are expected to apply their own judgment and discretion when utilizing the provided resources. Neither Varun Kumar Manik nor Simplilearn can guarantee specific results or outcomes from following the materials in this repository.

</details>

## Connect & Follow

For more info, please connect and follow me:

- Github: [https://github.com/manikcloud](https://github.com/manikcloud)
- LinkedIn: [https://www.linkedin.com/in/vkmanik/](https://www.linkedin.com/in/vkmanik/)
- Email: [varunmanik1@gmail.com](mailto:varunmanik1@gmail.com)
- Facebook: [https://www.facebook.com/cloudvirtualization/](https://www.facebook.com/cloudvirtualization/)
- YouTube: [https://bit.ly/32fknRN](https://bit.ly/32fknRN)
- Twitter: [https://twitter.com/varunkmanik](https://twitter.com/varunkmanik)
