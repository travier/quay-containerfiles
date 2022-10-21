# Containerfiles for various personal projects

Those containers are built using GitHub Actions and hosted on Quay.io and most
of them are Fedora based. Some might require volume mounts or manual
configuration.

Each `Containerfile` is in a specific folder in this repo.

## Service containers

| Quay.io repository | Description |
|-|-|
| [travier/php-fpm-ttrss)](https://quay.io/repository/travier/php-fpm-ttrss) | [PHP-FPM](https://www.php.net/manual/en/install.fpm.php) and modules for [Tiny Tiny RSS](https://tt-rss.org/) |
| [travier/unbound](https://quay.io/repository/travier/unbound) | [Unbound](https://www.nlnetlabs.nl/projects/unbound/about/) |
| [travier/nginx](https://quay.io/repository/travier/nginx) | [nginx](https://nginx.org/) |

## Hashicorp projects

| Quay.io repository | Description |
|-|-|
| [travier/nomad](https://quay.io/repository/travier/nomad) | [Nomad](https://www.nomadproject.io/) with [podman driver](https://github.com/hashicorp/nomad-driver-podman) (binaries only) |
| [travier/nomad-fedora](https://quay.io/repository/travier/nomad-fedora) | [Nomad](https://www.nomadproject.io/) with [podman driver](https://github.com/hashicorp/nomad-driver-podman), based on Fedora's container image (binaries and dependencies) |
| [travier/consul](https://quay.io/repository/travier/consul) | [consult](https://www.consul.io/) (binary only) |
| [travier/vault](https://quay.io/repository/travier/vault) | [vault](https://www.vaultproject.io/) (binary only) |

## Toolbox containers

| Quay.io repository | Description |
|-|-|
| [travier/toolbox](https://quay.io/repository/travier/toolbox) | Personal toolbox container image based on the Fedora toolbox image for general use cases |
| [travier/toolbox-kdedev](https://quay.io/repository/travier/toolbox-kdedev) | Toolbox container image based on the Fedora toolbox image for KDE development |
| [travier/toolbox-texlive](https://quay.io/repository/travier/toolbox-texlive) | Toolbox container image based on Fedora for LaTeX based projects |
