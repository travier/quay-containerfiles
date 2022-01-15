FROM registry.fedoraproject.org/fedora-toolbox:35

# Keep container image for 2 months
LABEL quay.expires-after=8w

# - Install common development tools
# - Install build dependencies for some Rust applications
# - Remove mlocate
RUN dnf -y distrosync && \
    dnf -y install \
      ImageMagick \
      awscli \
      brotli \
      butane \
      centpkg \
      createrepo_c \
      fd-find \
      fedpkg \
      flatpak-builder \
      fzf \
      go \
      jq \
      meson \
      minisign \
      mkpasswd \
      npm \
      pdf-stapler \
      pwgen \
      python3-dateparser \
      ripgrep \
      ruby \
      ruby-devel \
      rubygem-bundler \
      sqlite \
      vim \
      youtube-dl \
      zoxide \
      zsh \
      --exclude=nodejs-docs,nodejs-full-i18n,btrfs-progs,abattis-cantarell-fonts,adobe-source-code-pro-fonts,systemd-networkd,mercurial-py3,mercurial-py2,subversion && \
    dnf -y install \
      openssl-devel \
      perl-FindBin \
      perl-IPC-Cmd \
      perl-File-Compare && \
    dnf -y remove mlocate && \
    dnf clean all

# No need to clear the output as we will never use ZSH as a login shell and
# this clears output when exiting toolboxes.
RUN sed -i '/clear/d' /etc/zlogout
