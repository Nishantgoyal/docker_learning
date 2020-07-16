# Container Lifetime & Persistent Data

- Containers are usually immutable and ephemeral
- For "persistent data", i.e., databases and unique data, docker has two approaches:
  - Volumes: Make special location outside of container UFS
  - Bind Mounts: Links container path to host path

## Volume

- **VOLUME** command in Dockerfile
- The volume specified, outlives the container and need to be deleted
- Named Volumes can be used to provide names to the docker volumes using the `-v` option
  - e.g., docker container run -v mongo-data:/var/db mongo
- To use custom drivers and labels, we can use the `docker volume create` command to create a volume before using it in `docker container run`

