# Use Ubuntu as a base image
FROM ubuntu

# Update and install nginx
RUN apt-get update && apt-get install -y nginx

# Copy the custom index file to the nginx directory
COPY index.nginx-debian.html /var/www/html

# Start nginx in the foreground to keep the container running
CMD ["nginx", "-g", "daemon off;"]
