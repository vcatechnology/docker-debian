FROM debian:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

# Update all packages
RUN apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get -y autoremove && \
  apt-get clean

# Create install script
RUN touch                         /usr/local/bin/vca-install-package && \
  chmod +x                        /usr/local/bin/vca-install-package && \
  echo '#! /bin/sh'            >> /usr/local/bin/vca-install-package && \
  echo 'set -e'                >> /usr/local/bin/vca-install-package && \
  echo 'apt-get -y install $@' >> /usr/local/bin/vca-install-package && \
  echo 'apt-get -y clean'      >> /usr/local/bin/vca-install-package

# Create uninstall script
RUN touch                                /usr/local/bin/vca-uninstall-package && \
  chmod +x                               /usr/local/bin/vca-uninstall-package && \
  echo '#! /bin/sh'                   >> /usr/local/bin/vca-uninstall-package && \
  echo 'set -e'                       >> /usr/local/bin/vca-uninstall-package && \
  echo 'apt-get remove -y --purge $@' >> /usr/local/bin/vca-uninstall-package && \
  echo 'apt-get -y autoremove'        >> /usr/local/bin/vca-uninstall-package
