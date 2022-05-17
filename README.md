# Containerfiles for various personal projects

Those containers are built and hosted on Quay.io and most of them are Fedora
based. Some might require volume mounts or manual configuration.

Each `Containerfile` is in a specific folder in this repo.

## Service containers

| Status on Quay.io | Description |
|-|-|-|
| [![Container Repository on Quay](https://quay.io/repository/travier/php-fpm-ttrss/status "Container Repository on Quay")](https://quay.io/repository/travier/php-fpm-ttrss) | [PHP-FPM](https://www.php.net/manual/en/install.fpm.php) and modules for [Tiny Tiny RSS](https://tt-rss.org/) |
| [![Container Repository on Quay](https://quay.io/repository/travier/unbound/status "Container Repository on Quay")](https://quay.io/repository/travier/unbound) | [Unbound](https://www.nlnetlabs.nl/projects/unbound/about/) |
| [![Container Repository on Quay](https://quay.io/repository/travier/nginx/status "Container Repository on Quay")](https://quay.io/repository/travier/nginx) | [nginx](https://nginx.org/) |

## Hashicorp projects

| Status on Quay.io | Description |
|-|-|-|
| [![Container Repository on Quay](https://quay.io/repository/travier/nomad/status "Container Repository on Quay")](https://quay.io/repository/travier/nomad) | [Nomad](https://www.nomadproject.io/) with [podman driver](https://github.com/hashicorp/nomad-driver-podman) (binaries only) |
| [![Container Repository on Quay](https://quay.io/repository/travier/nomad-fedora/status "Container Repository on Quay")](https://quay.io/repository/travier/nomad-fedora) | [Nomad](https://www.nomadproject.io/) with [podman driver](https://github.com/hashicorp/nomad-driver-podman), based on Fedora's container image (binaries and dependencies) |
| [![Container Repository on Quay](https://quay.io/repository/travier/consul/status "Container Repository on Quay")](https://quay.io/repository/travier/consul) | [consult](https://www.consul.io/) (binary only) |
| [![Container Repository on Quay](https://quay.io/repository/travier/vault/status "Container Repository on Quay")](https://quay.io/repository/travier/vault) | [vault](https://www.vaultproject.io/) (binary only) |

## Toolbox containers

| Status on Quay.io | Description |
|-|-|-|
| [![Container Repository on Quay](https://quay.io/repository/travier/toolbox/status "Container Repository on Quay")](https://quay.io/repository/travier/toolbox) | Toolbox container image based on Fedora for general use cases |
| [![Container Repository on Quay](https://quay.io/repository/travier/toolbox-kdedev/status "Container Repository on Quay")](https://quay.io/repository/travier/toolbox-kdedev) | Toolbox container image based on Fedora for KDE development |
| [![Container Repository on Quay](https://quay.io/repository/travier/toolbox-texlive/status "Container Repository on Quay")](https://quay.io/repository/travier/toolbox-texlive) | Toolbox container image based on Fedora for work using LaTeX |
