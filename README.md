# Overview
More cloud environments are prepared to build Docker images as part of the CICD pipeline, however lack (or restrict) the capability to run in privileged mode. This excludes DinD, DooD, or mounting the docker socket to be able to build images.

# IMG Builder
This initiative is based on building Docker images in a containerized environment without having access to the socket or having elevated privileges. The build will be based on the [IMG docker build solution](https://github.com/genuinetools/img).

Test command not using privileged mode:
```
docker run --rm -it --security-opt seccomp=unconfined --security-opt apparmor=unconfined -v $(pwd):/app r.j3ss.co/img build -t jmaclean/jenkins-builder /app
```