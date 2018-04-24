#FROM registry.access.redhat.com/openshift3/jenkins-2-rhel7
FROM ljhiyh/rhel7-jooho
USER root
RUN rm -rf /opt/openshift/configuration/jobs/OpenShift\ Sample


RUN df
RUN find /etc/yum.repos.d

RUN "grep 'enabled = 1' /etc/yum.repos.d/redhat.repo"
RUN yum repolist
RUN "grep 'enabled = 1' /etc/yum.repos.d/redhat.repo"
RUN df
RUN find /etc/yum.repos.d
RUN exit 1



RUN yum repolist

#RUN  yum-config-manager --disable rhel-7-server-htb-rpms
     #yum repolist enabled

# jq
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm && \
    yum install -y jq

RUN yum repolist

USER 1001

# Plugin overrides
COPY plugins.txt /opt/openshift/configuration/plugins.txt
#RUN /usr/local/bin/install-plugins.sh /opt/openshift/configuration/plugins.txt
