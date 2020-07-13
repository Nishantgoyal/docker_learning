# Container Images, Where to find them, and how to build them

## What'a an Image

- App binaries and dependencies
- Metadata about the image data and how to run the image

## Image Layers

- To see the image layers: `docker image history <image>`
- Every set of changes that happen in the image form a layer.
- Every layer gets its own unique SHA, to help identify the layer
- To get all the details about the image: `docker image inspect <image>`

