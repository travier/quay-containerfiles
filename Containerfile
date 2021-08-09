FROM registry.fedoraproject.org/fedora-toolbox:34

RUN dnf -y distrosync && \
    dnf -y install \
      ImageMagick \
      awscli \
      brotli \
      butane \
      fd-find \
      fedpkg \
      flatpak-builder \
      fzf \
      go \
      jq \
      meson \
      minicom \
      npm \
      pdf-stapler \
      pwgen \
      ripgrep \
      ruby \
      ruby-devel \
      rubygem-bundler \
      vim \
      youtube-dl \
      zoxide \
      zsh \
      openssl-devel \
      --exclude=nodejs-docs,nodejs-full-i18n,btrfs-progs,abattis-cantarell-fonts,adobe-source-code-pro-fonts,systemd-networkd,mercurial-py3,mercurial-py2,subversion && \
    dnf clean all
