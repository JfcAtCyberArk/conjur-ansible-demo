FROM ruby:2.3

RUN apt update
RUN apt-get install -y openssh-server --no-install-recommends
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'root:Cyberark1' | chpasswd
RUN service ssh restart

WORKDIR /usr/src

COPY secrets.yml secrets.yml
COPY test_app.rb test_app.rb

EXPOSE 22
