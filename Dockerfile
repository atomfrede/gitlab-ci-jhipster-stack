FROM       ubuntu:xenial
MAINTAINER Frederik Hahne <frederik.hahne@gmail.com>

RUN apt-get install -y curl
# install node.js
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs python g++ build-essential

# install yeoman
RUN npm install -g yo

# install bower
RUN npm install -g bower

#install gulp
RUN npm install -g gulp

# install open jdk
RUN apt-get install -y openjdk-8-jdk
# install docker
RUN echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get purge lxc-docker
RUN apt-cache policy docker-engine
RUN apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
RUN apt-get install -y docker-engine
RUN service docker start
