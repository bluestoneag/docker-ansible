# pull base image
FROM ubuntu:latest

MAINTAINER BlueStone <support@bluestone.ch>

ENV TZ=Europe/Zurich
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update -qq && \
    apt-get install -y git python python3 python3-minimal python-dev python-dev python3-pip libkrb5-dev krb5-user && \
    apt-get install -y sshpass openssh-client && \
    pip install --upgrade pycrypto pywinrm && \
    pip install pywinrm[kerberos] && \
    python3 -m pip install ansible && \
    ansible-galaxy collection install community.windows && \
    mkdir -p /etc/ansible/ && \
    echo 'localhost' > /etc/ansible/hosts


# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
