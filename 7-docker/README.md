

# Lesson 7 Demo 2
Performing CRUD Operation on Containers

### Steps to be followed:
1.	Pulling a Docker image
2.	Creating a new container
3.	Stopping the container
4.	Listing all the containers
5.	Deleting the container
6.	Removing the image

### Step 1: Pulling a Docker image
1.1 Open the terminal and pull an image using the command:

```
sudo docker pull nginx


```


1.2 List all the docker images to check the newly pulled nginx image:

```
sudo docker images

```
 

### Step 2: Creating a new container
  2.1 Create a new container from the nginx image:

```
sudo docker run -dt -p 81:81 nginx

```
 

2.2 List all the running containers to check the newly created container. You can find 	various details like port of container, it’s time of creation and ID.

```
sudo docker ps

```
 
### Step 3: Stopping the container
3.1 Use the following command to stop the running container. (You can also us the 	container ID to stop the container: 
```
sudo docker stop CONTAINER_ID)


sudo docker stop CONTAINER_NAME

```
 

3.2 Use the following command to list all the running containers and verify if the container 	has stopped running:

```
sudo docker ps

```
 
3.3 You can start the container again and check the running containers. (You can also us the 	container ID to start the container: 

```
sudo docker start CONTAINER_ID)


sudo docker start CONTAINER_NAME

sudo docker ps

```

 

3.4 To start the container in interactive mode, use the –i and –t options. 
	
```
sudo docker run -it --name=Test_1 ubuntu

```
 
### Step 4: Listing all the containers
4.1 Use the below command to list all the containers started and the once which are stopped:

```
sudo docker ps -a

```
 

4.2 To list the containers by their ID, use the below command
                
```
sudo docker ps -aq

```
                
               
You can see the containers with ID are listed.

4.3 To list the total file size of each container, use the below command:

 
```
sudo docker ps -s

```
 

4.4 To list the latest created containers, use the following command:
         

```
sudo docker ps -l
 

```

### Step 5: Deleting the container
5.1 Stop the running container and remove it using the following commands:


```
sudo docker stop CONTAINER_NAME
sudo docker container rm CONTAINER_NAME
	 

```




### Step 6: Removing the image
6.1 Remove the image using the command:
	
```
sudo docker image rm nginx

```
 


----------------------------



# Lesson 7 Demo 3
Creating a Docker Image


### Steps to be followed:
1.	Creating the Dockerfile
2.	Executing the Dockerfile

### Step 1: Creating the Dockerfile
   1.1       Create a directory


```
mkdir demo
cd demo

```
 
1.2       Create the Dockerfile

```
vi Dockerfile

```
	 

1.3      Add the following code snippet to the Dockerfile

```
FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx
COPY index.nginx-debian.html /var/www/html
CMD nginx -g 'daemon off;'

```
 


1.4      Create another file in the same directory

```
vi index.nginx-debian.html

```
 
1.5        Add the following welcome message to the index file				

```
WELCOME TO NGINX.

```
 


### Step 2:  Executing the file
    2.1          Execute the Dockerfile (note that there is space between build and “.”)

```
sudo docker build . 
 

```
 

2.2       Navigate to the root folder, and list the images to check the newly created Docker image


```
cd
sudo docker images

```
 


------------------------------


# Lesson 7 Demo 4

```
Docker Compose Setup


```


### Steps to be followed:
1.	Setting up docker-compose
2.	Creating a docker-compose file

### Step 1: Setting up docker-compose
1.1    Install docker-compose using the command given below:

```
mkdir compose-test
cd compose-test
pip --version
 

```
 

1.2 Then type the command given below, to install docker-compose

```
sudo pip install docker-compose

```
 
 

### Step 2: Creating docker-compose file
2.1   Inside compose-test folder, create docker-compose.yml file, and add the following code in    it:

```
vi docker-compose.yml

```

2.2   Add the following code snippet in the file:
version: '2'


```
services:
  compose-test:
    image: centos
    links:
      - compose-db
    command: /usr/bin/curl compose-db:6379
  compose-db:
    image: redis
    expose:
      - "6379"

```
 




2.3   Run the following command to execute the yaml file:

```
sudo docker-compose up
 

```




------------------------------
# Lesson 7 Demo 5

## Docker Registry


### Steps to be followed:
1.	Pulling a Linux container
2.	Pushing the image to the local repository
3.	Running the new image

### Step 1: Pulling a Linux container
1.1    Pull a recent version of the Centos Linux container.

```
sudo docker pull registry:2

```
 
1.2    Run the registry in a new Docker container with port 5000 exposed

```
sudo docker run -d -p 5000:5000 \
--restart=always --name registry registry:2

```
 

1.3   Pull another image from Docker Hub and store it in the local registry

```
sudo docker pull ubuntu
 

```
1.4    Tag the image for the local registry

```
sudo docker tag ubuntu localhost:5000/ubuntu

```
 

### Step 2: Pushing the image to the local registry
2.1   Use the following command to push the image to a local registry:

```
sudo docker push localhost:5000/ubuntu

```
2.2   Remove the image from the local cache

```
sudo docker rmi ubuntu

```
2.3   Confirm that it has been removed

```
sudo docker images

```
 

### Step 3: Running the new image
3.1   Pull the image from the local registry

```
sudo docker pull localhost:5000/ubuntu

```
3.2   Confirm it is in the local cache

```
sudo docker images

```
3.3   Run the new image

```
sudo docker run -it --rm localhost:5000/ubuntu /bin/bash

```
3.4   Exit the container

```

exit

```
 
3.5   Clean up the images and containers

```
sudo docker rm -f $(docker ps -aq)

```

**Note:** In case you get a permission denied error as shown below, run the following

```
sudo chmod 666 /var/run/docker.sock

```
After running this, run the 
```
sudo docker rm -f $(docker ps -aq) command.
 

sudo docker rmi $(docker images -q)

```
 


-------------------------------
# Lesson 7 Demo 6
## Docker Networking with SSHs


### Steps to be followed:
1.	Creating a container and committing it
2.	Creating a bridge network and finding its IP address
3.	Connecting the network from another SSH server

### Step 1: Creating a container, and commit it
1.1   Create a Centos Docker container. and install net-tools

```
sudo docker run -it --name centos centos /bin/bash
yum install -y net-tools

```


1.2   Check the IP address and hostname


```
ifconfig
cat /etc/hosts
hostname
 

```
1.3   Exit the container using CTRL+D
	1.3.1   Commit the container to an image (Please refer to the screenshot)

```
	docker commit centos centos-net
	docker images
	docker rm centos

```
 
### Step 2: Creating a bridge network, and find its IP address
2.1  Create a bridge network, and find its IP range

```
docker network create exnet
docker network ls
docker network inspect exnet

```
 
 

2.2  Run the centos container using the new network

```
docker run -it --rm --network exnet centos-net /bin/bash

```

2.3   Check the IP address and hostname

```
ifconfig
cat /etc/hosts
hostname

```
 

2.4   Exit the container using CTRL+D
	2.4.1 Start a new container using the default network

```
	docker run -it --rm --name centos centos-net /bin/bash

```
2.5   Check the IP address and hostname

```
ifconfig
cat /etc/hosts
hostname

```
 
### Step 3: Connecting the network from another SSH server
3.1  Click on + to open another Terminal window. Type the below given command to from the second SSH terminal to connect the network to the container

```
docker network connect exnet centos

```
 

3.2   Go back to the running container. You will see that it now has two IP addresses (Please refer to the screenshot)

```
ifconfig
cat /etc/hosts
hostname
 

```

3.3   Go to the second SSH window, and disconnect the network

```
docker network disconnect exnet centos

```
 
3.4   Go back to the running container, and see that it now has one IP address

```
ifconfig
cat /etc/hosts
hostname

```
 
3.5   Exit the container using CTRL+D

______________