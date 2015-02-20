FROM centos:centos7

RUN yum clean all
RUN yum -y update

RUN yum -y install rpm-build make zlib-devel openssl-devel curl-devel expat-devel gettext xmlto asciidoc gcc

RUN yum -y install "perl(Error)" "perl(ExtUtils::MakeMaker)"

RUN mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
RUN echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

ADD ./git.spec /root/rpmbuild/SPECS/git.spec
ADD ./build-rpm.sh /build-rpm.sh

RUN chmod +x /build-rpm.sh

RUN yum -y install wget
RUN wget https://www.kernel.org/pub/software/scm/git/git-2.3.0.tar.gz -O /root/rpmbuild/SOURCES/git-2.3.0.tar.gz

VOLUME ["/rpms"]

CMD ["/build-rpm.sh"]
