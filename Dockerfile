FROM registry.access.redhat.com/openshift3/jenkins-2-rhel7

RUN rm -rf /opt/openshift/configuration/jobs/OpenShift\ Sample

USER root

RUN subscription-manager repos --list-enabled; yum repolist enabled; cat /etc/yum.repos.d/redhat.repo; ls /var/cache/yum/x86_64/7Server/
RUN  yum-config-manager --disable rhel-7-server-htb-rpms && \
     yum repolist enabled

# jq
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm && \
    yum install -y jq


USER 1001

# Plugin overrides
COPY plugins.txt /opt/openshift/configuration/plugins.txt
RUN /usr/local/bin/install-plugins.sh /opt/openshift/configuration/plugins.txt
