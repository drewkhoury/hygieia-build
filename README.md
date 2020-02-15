# hygieia-build
Scripts to install hygieia via docker containers


# Instructions

Create a docker image that will run the build commands for hygieia (as per https://hygieia.github.io/Hygieia/setup.html).

```
# source files saved in /tmp/src in the container
docker build . -t hygieiabuild
```

You can run any post-build commands by creating a container from the build image:

```
# your hosts local folder mounted to /tmp/hygieia-build in the container
docker run -it -v $(pwd):/tmp/hygieia-build hygieiabuild bash
```

Note: Because some commands are failing they've been commented out in Dockerfile. Run them manually to debug or see below.

# Issues

Currently the following command is erroring:

```
cd /tmp/src/api/ && mvn clean install
```

with:

```
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.1:compile (default-compile) on project api: Compilation failure
[ERROR] /tmp/src/api/src/main/java/com/capitalone/dashboard/service/CommitServiceImpl.java:[23,35] package org.omg.PortableInterceptor does not exist
[ERROR]
[ERROR] -> [Help 1]
[ERROR]
[ERROR] To see the full stack trace of the errors, re-run Maven with the -e switch.
[ERROR] Re-run Maven using the -X switch to enable full debug logging.
[ERROR]
[ERROR] For more information about the errors and possible solutions, please read the following articles:
[ERROR] [Help 1] http://cwiki.apache.org/confluence/display/MAVEN/MojoFailureException
```

which may be related to: https://github.com/Hygieia/hygieia-api/issues/2
