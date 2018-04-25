FROM rhel  

WORKDIR /app

# install git / gcc / wget
RUN yum install -y git \
	&& yum groupinstall -y "Development Tools" \
	&& yum install -y wget


# clone obliv-c download ocaml & opam
RUN cd /app \
	&& git clone https://github.com/samee/obliv-c.git \
	&& wget http://caml.inria.fr/pub/distrib/ocaml-4.06/ocaml-4.06.0.tar.gz \
	&& wget https://github.com/ocaml/opam/archive/latest.tar.gz

# unzip ocaml and install
RUN tar -xvzf /app/ocaml-4.06.0.tar.gz \
	&& cd /app/ocaml-4.06.0 \
	&& ./configure --prefix ~/local \
	&& make world.opt \
	&& make bootstrap \
	&& umask 022 \
	&& make install \
	&& make clean 

# unzip opam and install
RUN tar -xvzf /app/latest.tar.gz \
	&& cd /app/opam-latest \
	&& ./configure \
	&& make \
	&& make install

RUN opam init \
RUN eval `opam config env`

USER 1001