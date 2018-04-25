# Docker with Supercronic

A docker-in-docker based image, with Supercronic installed.

See [Supercronic, a cron for containers](https://github.com/aptible/supercronic) for a complete description of supercronic.

Being based on docker, this allows the cron entries to use docker either inside the container, or more normally communicate with the host docker to execute commands.

Effectively, this means any docker image may be periodically launched through Supercronic, and then cleaned up later.

All the examples here assume that the docker host is also used to run the docker images, through mounting of `/var/run/docker.sock`

The CRONTAB environment variable is used to define the cron for Supercronic.

## Getting Started

The complete crontab must be stored within the CRONTAB variable.

Example Usage:

```shell
echo '# Say hello with cowsay every 5 seconds
*/5 * * * * * * docker run -e TZ --rm wernight/funbox cowsay "Hi, it is `date`"

# Tell a fortune at 7am
7 * * * * docker run -e TZ --rm wernight/funbox fortune' > sample-crontab

CRONTAB=`cat sample-crontab` docker run -e CRONTAB -e TZ="Australia/Melbourne" --detach --privileged -v /var/run/docker.sock:/var/run/docker.sock trammel/docker-with-supercronic
```

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Environment variables

***CRONTAB***

The CRONTAB variable must contain a complete, well formatted crontab for Supercronic to run.

***TZ***

By default docker will run containers in UTC. You'll need to explicitly set the timezone (TZ) environment variable to match your expectations.

##### Standard detached usage

```shell
CRONTAB=`cat sample-crontab` docker run -e CRONTAB -e TZ="Australia/Melbourne" --detach --privileged -v /var/run/docker.sock:/var/run/docker.sock trammel/docker-with-supercronic
```

##### Testing in interactive mode

```shell
CRONTAB=`cat sample-crontab` docker run -e CRONTAB -e TZ="Australia/Melbourne" --privileged --rm -it -v /var/run/docker.sock:/var/run/docker.sock trammel/docker-with-supercronic
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

This project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details.
