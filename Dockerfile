FROM centos:centos7

#Install base OS tools
RUN yum -y install python3 \
        wget \
    && yum clean all && rm -rf /var/cache/yum

RUN pip3 install robotframework

#Setup directories
RUN mkdir robotframework; \
    cd robotframework; \
    mkdir resources; \
    cd resources

#Install extensions to robotframework in robotframework/resources that cannot be installed with pip
RUN wget https://github.com/robotframework/remoteswinglibrary/releases/download/2.2.4/remoteswinglibrary-2.2.4.jar; \
    mv remoteswinglibrary-2.2.4.jar robotframework/resources

COPY robot /root/tests

WORKDIR /root/tests

CMD ["robot", "-d", "results", "tests"]