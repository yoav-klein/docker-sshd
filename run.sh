

ssh-keygen -f "/home/yoav/.ssh/known_hosts" -R "[127.0.0.1]:2222"
# One way: just run the container with the default CMD
# docker run -it -p 2222:22 sshd:latest

# Another way: run `cat`, and then use docker exec
docker run --name sshd --rm -td -p 2222:22 sshd:latest cat
docker exec -it sshd sudo /usr/sbin/sshd
