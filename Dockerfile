

FROM ubuntu:latest

RUN apt-get update && apt-get install -y openssh-server \
	sudo
RUN service ssh start
RUN useradd -m develop \
	&& echo "develop:develop" | chpasswd \
	&& usermod -aG sudo develop
	

USER develop

# one way - run sshd in CMD. -D is used to keep the container up.
CMD ["/usr/sbin/sshd", "-D"]
