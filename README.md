# Side Projects Provider
This repository contains many different infrastructure components to support hosting multiple side projects more easily. The setup is optimized towards minimal resource usage, and is proven to work just fine with 5+ services being deployed simultaneously on a single t3.nano EC2 instance.

Every command in this guide assumes that the repository will be cloned into `~/side-projects-provider`, and that the commands will be launched from `~/side-projects-provider/docker`.

## Deployment
If all the services are described directly in `docker-compose.override.yml`, then the simple deployment process can be successfully conducted with:
```shell
docker compose up -d 
```

If however the services are more complex and contain their own `docker-compose.yml` files, then proceed with creating `Makefile` based on `Makefile.example` template:
```shell
cp Makefile.example Makefile
```
and then deploy the services with:
```shell
make start
```

## SSL
To generate SSL certificate for the first time run:
```shell
make generate
```

To automatically renew SSL certificate add this schedule expression to `crontab -e`:
```shell
0 2 * * 0 make -C ~/side-projects-provider/docker renew
```
