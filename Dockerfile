FROM debian:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

# Update all packages
RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get -y autoremove && \
  apt-get clean

# Install useful packages
RUN apt-get install \
  git
