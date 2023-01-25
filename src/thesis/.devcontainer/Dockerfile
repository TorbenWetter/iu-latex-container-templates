# Use the `kinetic` variant of the buildpack-deps image as the base image.
# It is based on Ubuntu and includes common tools and libraries such as Git, GCC, and OpenSSL, as well as programming languages like Ruby, Node.js, and Python.
ARG VARIANT="kinetic"
FROM buildpack-deps:${VARIANT}-curl

# Indicate that the image has the common features installed.
LABEL dev.containers.features="common"

# Accept the Microsoft EULA for the fonts (Arial).
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections

# Install additional OS packages and clean up.
RUN apt-get update \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get install -y --no-install-recommends biber cpanminus locales make python3-pygments ttf-mscorefonts-installer \
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

# Install cpanm and missing Perl modules.
RUN curl -L http://cpanmin.us | perl - App::cpanminus \
  && cpanm File::HomeDir Pod::Usage YAML::Tiny

# Generate the German locale and set it as the default.
RUN locale-gen de_DE.UTF-8
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE:de
ENV LC_ALL de_DE.UTF-8

# Define environment variables for TeX Live.
ENV TEXDIR /usr/local/texlive
ENV TEXUSERDIR ~/.texlive

# Install TeX Live and add to PATH.
WORKDIR /tmp
RUN wget -qO - https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar xz --strip-components=1 \
  && perl ./install-tl --no-interaction --scheme=basic --no-doc-install --no-src-install --texdir=$TEXDIR --texuserdir=$TEXUSERDIR
ENV PATH $TEXDIR/bin/aarch64-linux:$TEXDIR/bin/x86_64-linux:$PATH

# Update the TeX Live package manager and install additional packages.
RUN tlmgr update --self --all \
  && tlmgr install babel-german biblatex biblatex-apa booktabs caption csquotes etoolbox fontspec hyphen-german latexindent latexmk minted newfloat parskip ragged2e setspace sidecap titlesec \
  && tlmgr update --all \
  && texhash

# Verify the binaries work and have the right permissions.
RUN tlmgr version \
  && latexmk -version \
  && texhash --version