FROM centos:6

MAINTAINER kopug "https://github.com/kopug"

# yum update
RUN yum -y update

# Append epel repository
RUN yum -y install epel-release

# rbenv
RUN yum -y install git zlib zlib-devel readline readline-devel openssl openssl-devel curl curl-devel
RUN yum -y install gcc vim
RUN git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
RUN git clone https://github.com/sstephenson/rbenv-default-gems.git /usr/local/rbenv/plugins/rbenv-default-gems
RUN echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="/usr/local/rbenv/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

RUN echo 'bundler' >> /usr/local/rbenv/default-gems

# Install multiple versions of ruby
ENV CONFIGURE_OPTS --disable-install-doc
ADD ./versions.txt /root/versions.txt
RUN /bin/bash --login -c 'xargs -L 1 rbenv install < /root/versions.txt'
RUN /bin/bash --login -c 'rbenv global $(tail -1 /root/versions.txt)'

CMD ["/bin/bash", "--login"]
