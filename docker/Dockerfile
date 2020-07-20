FROM centos:centos7

#Install base OS tools
RUN yum -y install python3 \
        wget \
        robotframework \
    && yum clean all && rm -rf /var/cache/yum

#Setup directories
RUN mkdir robotframework; \
    cd robotframework; \
    mkdir resources; \
    cd resources

#Install extensions to robotframework in robotframework/resources that cannot be installed with pip
RUN wget https://github.com/robotframework/remoteswinglibrary/releases/download/2.2.4/remoteswinglibrary-2.2.4.jar; \
    mv remoteswinglibrary-2.2.4.jar robotframework/resources

#TODO Mount a volume where the tests are located?
#TODO Mount a volume where the system under test is located