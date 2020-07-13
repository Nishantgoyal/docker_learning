# Container Images, Where to find them, and how to build them

## What'a an Image

- App binaries and dependencies
- Metadata about the image data and how to run the image

## Image Layers

- To see the image layers: `docker image history <image>`
- Every set of changes that happen in the image form a layer.
- Every layer gets its own unique SHA, to help identify the layer
- To get all the details about the image: `docker image inspect <image>`

## Image Tagging

- Images do not have a name
- Images are identified using `<user>/<repo>:<tag>`
- Default tag is `latest`
- For official repositories `<user>` is not required
- Tag is a pointer to a specific image commit
- Docker images can have multiple tags for the same commit, and will check the SHA before download.
- To retag an image: `docker image tag <source image> <new image>`
- To push an image to remote repository: `docker image push <user>/<repo>:<tag>`
  - require login: `docker login`

