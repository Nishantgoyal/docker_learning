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
- To see the list of running processes inside a container: `docker container top <container name/id>`

## What happens in 'docker container run'

1. Looks for the image locally in image cache, doesn't find anything
2. Then looks in remote image repository (defaults to Docker Hub)
3. Download the latest verstion (if none specified)
4. Creates new container based on that image and prepares to start
5. Gives it a virtual IP on a private network inside docker network
6. Opens up host port (if published), and forward traffic to the container port
7. Starts container by using CMD in the image Dockerfile

## Containers vs VMs

- Containers are just processes restricted to the resources they can access inside the host

## CLI Process Monitoring

- process list in one container: `docker container top`
- details of one container config: `docker container inspect`
- performance monitoring for all containers: `docker container stat`
