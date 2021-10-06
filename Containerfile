FROM registry.fedoraproject.org/fedora-toolbox:35

# Keep container image for 2 months
LABEL quay.expires-after=8w

# Ignore errors encountered during flatpak install in:
# dnf builddep plasma-discover
RUN dnf -y distrosync && \
    dnf -y install \
      fd-find \
      fedpkg \
      flatpak-builder \
      fzf \
      go \
      jq \
      meson \
      ripgrep \
      vim \
      zoxide \
      zsh \
      --exclude=btrfs-progs,abattis-cantarell-fonts,adobe-source-code-pro-fonts,systemd-networkd,mercurial-py3,mercurial-py2,subversion \
      && \
    dnf -y install \
      breeze-cursor-theme \
      breeze-icon-theme \
      gdb \
      git-clang-format \
      kdevelop \
      strace \
      rpm-ostree-devel \
      && \
    dnf -y builddep \
      plasma-discover \
      ; \
    dnf clean all

# No need to clear the output as we will never use ZSH as a login shell and
# this clears output when exiting toolboxes.
RUN sed -i '/clear/d' /etc/zlogout
