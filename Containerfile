FROM registry.fedoraproject.org/fedora-toolbox:35

RUN dnf -y distrosync && \
    dnf -y install \
      ImageMagick \
      brotli \
      dejavu-sans-fonts \
      dejavu-sans-mono-fonts \
      fd-find \
      fzf \
      graphviz \
      inkscape \
      jq \
      latexmk \
      meson \
      npm \
      pandoc \
      pdf-stapler \
      ripgrep \
      ruby \
      ruby-devel \
      rubygem-bundler \
      texlive \
      texlive-babel-french \
      texlive-bbding \
      texlive-bigfoot \
      texlive-dejavu \
      texlive-fontawesome \
      texlive-minted \
      texlive-textpos \
      vim \
      zoxide \
      zsh \
      --exclude=nodejs-docs,nodejs-full-i18n,btrfs-progs,abattis-cantarell-fonts,adobe-source-code-pro-fonts,systemd-networkd,mercurial-py3,mercurial-py2,subversion,dconf,grubby,kpartx,memstrack && \
    dnf clean all
