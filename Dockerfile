FROM centos:7

RUN yum check-update; \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum install -y python3-pip; \
    yum install -y wget; \
    yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install "ansible"; \
    pip3 install "paramiko"; \
    ansible-galaxy collection install community.network
