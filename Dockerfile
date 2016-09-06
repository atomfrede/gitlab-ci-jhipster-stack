FROM       ubuntu
MAINTAINER Frederik Hahne <frederik.hahne@gmail.com>

RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates
# install open jdk
RUN apt-get install -y openjdk-8-jdk

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

# install docker
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get purge lxc-docker
RUN apt-cache policy docker-engine
RUN apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
RUN apt-get install -y docker-engine
RUN service docker start
