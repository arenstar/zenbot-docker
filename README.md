# zenbot-docker

```
git clone https://github.com/arenstar/zenbot-docker
cd zenbot-docker
vagrant up
vagrant ssh
sudo su
docker-compose -f /vagrant/docker-compose.yml logs -f
```

## Run your own bot
```
docker run -it --rm --link vagrant_mongodb_1:mongodb arenstar/zenbot /bin/bash
```
