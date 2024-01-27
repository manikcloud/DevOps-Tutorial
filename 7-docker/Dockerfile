# Use Ubuntu as a base image
FROM ubuntu:22.04

# Update and install nginx
RUN apt-get update 

RUN apt-get install -y nginx

# Copy the custom index file to the nginx directory
COPY index.html /var/www/html

EXPOSE 80

# Start nginx in the foreground to keep the container running
CMD ["nginx", "-g", "daemon off;"]
