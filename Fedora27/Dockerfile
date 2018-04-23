FROM fedora:27

WORKDIR /app

RUN dnf install -y git-all

RUN cd /app \
	&& git clone https://github.com/samee/obliv-c.git

RUN dnf install -y glibc-devel.i686 ocaml ocaml-ocamldoc ocaml-findlib ocaml-findlib-devel ocaml-ocamlbuild libgcrypt libgcrypt-devel perl-ExtUtils-MakeMaker perl-Data-Dumper glibc-devel.x86_64 redhat-rpm-config

RUN dnf install -y opam m4 patch unzip

RUN opam init
RUN opam switch --yes create 4.06.0
RUN eval 'opam config env'
RUN opam install --yes camlp4 ocamlfind ocamlbuild batteries

RUN cd /app/obliv-c \
	&& ./configure \
	&& make

USER 185

CMD "bash"