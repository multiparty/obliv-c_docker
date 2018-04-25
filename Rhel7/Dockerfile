FROM rhel  

WORKDIR /app

# install git & gcc
RUN yum install -y git \
	&& yum groupinstall -y "Development Tools" 

# clone obliv-c & ocaml
RUN cd /app \
	&& git clone https://github.com/samee/obliv-c.git 

	http://caml.inria.fr/pub/distrib/ocaml-4.06/ocaml-4.06.0.tar.gz

# packages
RUN yum install -y glibc-devel.x86_64 \
	&& yum install -y libgcrypt \
	&& yum install -y libgcrypt-devel \
	&& yum install -y redhat-rpm-config \
	&& yum install -y perl-ExtUtils-MakeMaker \
	&& yum install -y perl-Data-Dumper 

# opam installer
RUN yum install -y wget \
	&& wget https://raw.github.com/ocaml/opam/master/shell/opam_installer.sh -O - | sh -s /usr/local/bin

# init opam & install ocaml packages
RUN opam init -y \
	&& opam update \
	&& opam switch 4.06.0 \
	&& eval `opam config env` \
	&& opam install -y camlp4 ocamlbuild batteries doc-ock

# install obliv-c
RUN cd /app/obliv-c \
	&& ./configure \
	&& make

USER 1001

