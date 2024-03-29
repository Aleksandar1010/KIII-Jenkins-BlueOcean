FROM jenkins/jenkins:lts
LABEL maintainer="aleksandar.sajkoski@students.finki.ukim.mk"
ENV REFRESHED_AT 2024-03-29

USER root

RUN apt-get -qqy update \
    && apt-get install -qqy sudo \
    && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && apt-get install -qqy curl

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh $(cat /usr/share/jenkins/ref/plugins.txt) || true
