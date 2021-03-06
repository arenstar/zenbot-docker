install:
	apt-get update
	apt-get -y install
	echo 'Defaults    env_keep+=SSH_AUTH_SOCK' > /etc/sudoers.d/ssh_auth_sock
	curl -sSL https://get.docker.com/ | sh
	curl -sSL "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-Linux-x86_64" > /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose

run:
	mkdir -p /var/lib/mongodb/data
	docker-compose -f docker-compose.yml up -d

down:
	docker-compose -f docker-compose.yml down

clean:
	docker-compose -f docker-compose.yml kill
	rm -rf /var/lib/mongodb/data
