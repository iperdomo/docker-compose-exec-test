# docker-compose-exec-test
Testing docker-compose exec + bind mounts on GitHub actions

## `-T` vs `--no-TTY`

When using `docker-compose exec` you need to disable the automatic TTY allocation. In version
`v1.29.2` only `-T` flag is available and `--no-TTY` is _ignored_
https://github.com/docker/compose/blob/5becea4ca9f68875334c92f191a13482bcd6e5cf/compose/cli/main.py#L552

To take advantage of the latest `compose` use `docker compose`, notice the lack of `-` in the
middle.

More info: https://docs.docker.com/compose/#compose-v2-and-the-new-docker-compose-command
