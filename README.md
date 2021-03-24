This repo is used to store the Dockerfiles used to build our base images.

# How to build a new image

1. Start by creating the base image folder (ie. `12.21.0`)
2. Use a previous template and modify the node version. Typically we use `-slim` as we don't need the full-blown original node image
3. Navigate to that directory and run `docker build -t edvisorio/node:<new_version> .`. This will build the image locally on your machine
4. Run `docker push edvisorio/node:<new_version>`. This will push the image to our remoet repository in dockerhub
5. Create another directory for the `build` image (naming is `<version>-build`). This is typically the image we use in our CI environments as it comes with some pre-added things to make our lives easier.
6. Navigate to that directory and run `docker build -t edvisorio/node:<new_version>-build .`. This will build the image locally on your machine
7. Run `docker push edvisorio/node:<new_version>-build`. This will push the image to our remoet repository in dockerhub