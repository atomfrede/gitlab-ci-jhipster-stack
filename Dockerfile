FROM       java
MAINTAINER Frederik Hahne <frederik.hahne@gmail.com>

# install node.js
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs python g++ build-essential

# install yeoman
RUN npm install -g yo

# install bower
RUN npm install -g bower

#install gulp
RUN npm install -g gulp

ADD settings.xml ~./m2/settings.xml
