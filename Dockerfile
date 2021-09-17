FROM ubuntu:20.04

RUN apt-get update; \
    apt-get install -y gcc libffi-devel python3; \
    apt-get install -y python3-pip wget openssh-server sudo; 
    
RUN pip3 install --upgrade pip; \
    pip3 install "ansible"; \
    pip3 install "paramiko"; \
    ansible-galaxy collection install community.network
    
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ansible

RUN  echo 'ansible:admin' | chpasswd

RUN service ssh start

CMD ["/usr/sbin/sshd","-D"]
