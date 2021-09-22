FROM ubuntu:20.04
ENV TZ=America/La_Paz

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update; \
    apt-get install -y locales; \
    apt-get install -y python3; \
    apt-get install -y python3-pip wget openssh-server sudo; 
    
RUN pip3 install --upgrade pip; \
    pip3 install "ansible"; \
    pip3 install "paramiko"; \
    pip3 install "librouteros"; \
    ansible-galaxy collection install community.network; \
    ansible-galaxy collection install community.routeros;
    
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ansible

RUN  echo 'ansible:admin' | chpasswd

RUN service ssh start

CMD ["/usr/sbin/sshd","-D"]
