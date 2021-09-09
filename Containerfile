FROM registry.fedoraproject.org/fedora-toolbox:35

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
    dnf install kdevelop breeze-cursor-theme breeze-icon-theme git-clang-format && \
    dnf builddep plasma-discover ; \
    dnf clean all
