FROM       openjdk
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
