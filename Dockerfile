FROM maven

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_10.x -o /tmp/nodesource_setup.sh
RUN bash /tmp/nodesource_setup.sh
RUN apt-get install nodejs -y

RUN mkdir /tmp/src && cd /tmp/src && \
git clone https://github.com/Hygieia/Hygieia.git && \
git clone https://github.com/Hygieia/hygieia-core.git && \
git clone https://github.com/Hygieia/api.git

RUN cd /tmp/src/hygieia-core/ && mvn clean install 
RUN cd /tmp/src/Hygieia/UI/ && npm install
#RUN cd /tmp/src/api/ && mvn clean install
#RUN cd /tmp/src/Hygieia/ && mvn clean install 

