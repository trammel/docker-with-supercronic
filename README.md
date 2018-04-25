# Docker with supercronic

A docker-in-docker based image, with supercronic installed.

See [supercronic, a cron for containers](https://github.com/aptible/supercronic) for a complete description of supercronic.

Being based on docker, this allows the cron entries to use docker either inside the container, or more normally communicate with the host docker to execute commands.

## Getting Started

Put a crontab within a volume, or have it available on the docker host.
 
Run the container by passing the path crontab filename as the first argument.

### Host mount
```shell
docker run --privileged --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/host/path/crons:/crons trammel/docker-with-supercronic /crons/crontab 
```

### Volume mount
```shell
docker run --privileged --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v my-crons:/crons trammel/docker-with-supercronic /crons/crontab 
```

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

#### Container Parameters

***Crontab location***

```shell
docker run --privileged --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/host/path/crons:/crons trammel/docker-with-supercronic /crons/crontab 
```

##### Opening a shell on the container

```shell
docker run --privileged --entrypoint= --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/host/path/crons:/crons trammel/docker-with-supercronic /bin/sh 
```

#### Volumes


* `/tmp/host/path/crons/` - A place for crontab
*  `/var/run/docker.sock:/var/run/docker.sock` - Allows docker in the container to use host docker.

## Find Us

* [GitHub](https://github.com/trammel/docker-with-supercronic)

## Authors

* **Docker Inc** - *Docker* - [Docker](https://hub.docker.com/_/docker/)
* **Aptible** - *Supercronic* - [Supercronic](https://github.com/aptible/supercronic)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
