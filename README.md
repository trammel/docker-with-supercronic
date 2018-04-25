# Docker with Supercronic

A docker-in-docker based image, with Supercronic installed.

See [Supercronic, a cron for containers](https://github.com/aptible/supercronic) for a complete description of supercronic.

Being based on docker, this allows the cron entries to use docker either inside the container, or more normally communicate with the host docker to execute commands.

The CRONTAB environment variable is used to define the cron for supercronic.

## Getting Started

The complete crontab must be stored within the CRONTAB variable.

Eg. ``` export CRONTAB=`cat sample-crontab` ```

```shell
CRONTAB=`cat sample-crontab` docker run -e CRONTAB --detach --privileged -v /var/run/docker.sock:/var/run/docker.sock trammel/docker-with-supercronic
```

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Environment variables

***CRONTAB***

The CRONTAB variable must contain a complete, well formatted crontab for supercronic to run.

##### Standard detached usage

```shell
CRONTAB=`cat sample-crontab` docker run -e CRONTAB --detach --privileged -v /var/run/docker.sock:/var/run/docker.sock trammel/docker-with-supercronic
```

##### Testing in interactive mode

```shell
CRONTAB=`cat sample-crontab` docker run -e CRONTAB --privileged --rm -it -v /var/run/docker.sock:/var/run/docker.sock trammel/docker-with-supercronic
```

##### Opening a shell on the container

```shell
docker run --privileged --entrypoint= --rm -it -v /var/run/docker.sock:/var/run/docker.sock trammel/docker-with-supercronic /bin/sh
```

#### Volumes

*  `/var/run/docker.sock:/var/run/docker.sock` - Allows docker in the container to use host docker.

## Find Us

* [GitHub](https://github.com/trammel/docker-with-supercronic)

## Authors

* **Docker Inc** - *Docker* - [Docker](https://hub.docker.com/_/docker/)
* **Aptible** - *Supercronic* - [Supercronic](https://github.com/aptible/supercronic)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
