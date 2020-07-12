# Creating and using containers

## Checking out Docker install and config

- Check docker version: `docker version`
- get docker info: `docker info`

## Image vs Container

- An image is the application we want to run
- A container is an instance of that image running as a process

## Starting an Nginx Container

- `docker container run -p 8080:80 nginx`
  1. Downloaded image 'nginx' from Docker Hub
  2. Started a new container from that image
  3. `-p` (publish) option opened port 8080 on the host IP, and routed that traffic to the container IP on post 80
  4. `-d` (detatch) option will run the application in the background
  5. `--name` can be used to provide a unique name to the container
- To list running containers: `docker container ls`
- To stop a running container: `docker container stop <container-id>`
- To list all containers: `docker container ls -a`
- To see logs of a running container: `docker container logs <container name/id>`
