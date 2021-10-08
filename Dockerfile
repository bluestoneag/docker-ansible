# pull base image
FROM ubuntu:latest

MAINTAINER BlueStone <support@bluestone.ch>


RUN apt-get update -qq && \
    apt-get install -y git python python3 python3-minimal python-dev python-dev python3-pip && \
    apt-get install -y sshpass openssh-client && \
    pip install --upgrade pycrypto pywinrm && \
    python3 -m pip install ansible && \
    mkdir -p /etc/ansible/ && \
    echo 'localhost' > /etc/ansible/hosts


# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]