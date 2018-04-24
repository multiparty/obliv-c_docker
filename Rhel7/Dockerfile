FROM rhel  

WORKDIR /app

# install git & gcc
RUN yum install -y git \
	&& yum groupinstall -y "Development Tools" 

# clone obliv-c
RUN cd /app \
	&& git clone https://github.com/samee/obliv-c.git

# clone & install ocaml
RUN cd /app \
	 && git clone https://github.com/ocaml/ocaml.git \
	 && cd /app/ocaml \
	 && ./configure

# crypto packages
RUN yum install -y glibc-devel.x86_64 \
	&& yum install -y libgcrypt \
	&& yum install -y libgcrypt-devel 

# redhat config package
RUN yum install -y redhat-rpm-config

# perl packages
RUN yum install -y perl-ExtUtils-MakeMaker \
	&& yum install -y perl-Data-Dumper 

RUN yum install -y wget \
	&& wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin

RUN opam init --comp=4.06.0 \
	&& eval 'opam config env' \
	&& opam install --yes camlp4 ocamlfind ocamlbuild batteries

RUN cd /app/obliv-c \
	&& ./configure \
	&& make

# This default user is created in the openshift/base-centos7 image
USER 1001

