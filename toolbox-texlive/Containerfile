FROM registry.fedoraproject.org/fedora-toolbox:35

# Keep container image for 2 months
LABEL quay.expires-after=8w

# - Install common development tools
# - Install texlive packages
# - Remove mlocate
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
    dnf -y remove mlocate && \
    dnf clean all

# No need to clear the output as we will never use ZSH as a login shell and
# this clears output when exiting toolboxes.
RUN sed -i '/clear/d' /etc/zlogout
