# hygieia-build
Scripts to install Hygieia via docker containers


## Instructions

Create a docker image that will run the build commands for hygieia (as per https://hygieia.github.io/Hygieia/setup.html).

```
# source files saved in /tmp/src in the container
docker build . -t hygieiabuild
```

You can run any post-build commands by creating a container from the build image:

```
# your host's local folder mounted to /tmp/hygieia-build in the container
docker run -it -v $(pwd):/tmp/hygieia-build hygieiabuild bash
```
