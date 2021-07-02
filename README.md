# Containerfiles for various personal projects

Those containers are built and hosted on Quay.io and most of them are Fedora
based. Some might require volume mounts or manual configuration.

Each `Containerfile` is in a specific branch in this repo:

| Status on Quay.io | Branch | Description |
|-|-|-|
| [![Container Repository on Quay](https://quay.io/repository/travier/php-fpm-ttrss/status "Container Repository on Quay")](https://quay.io/repository/travier/php-fpm-ttrss) | [php-fpm-ttrss](https://github.com/travier/quay-containerfiles/tree/php-fpm-ttrss) | [PHP-FPM](https://www.php.net/manual/en/install.fpm.php) and modules for [Tiny Tiny RSS](https://tt-rss.org/) |
| [![Container Repository on Quay](https://quay.io/repository/travier/unbound/status "Container Repository on Quay")](https://quay.io/repository/travier/unbound) | [unbound](https://github.com/travier/quay-containerfiles/tree/unbound) | [Unbound](https://www.nlnetlabs.nl/projects/unbound/about/) |
| [![Container Repository on Quay](https://quay.io/repository/travier/nomad/status "Container Repository on Quay")](https://quay.io/repository/travier/nomad) | [nomad](https://github.com/travier/quay-containerfiles/tree/nomad) | [Nomad](https://www.nomadproject.io/) binary with [podman driver](https://github.com/hashicorp/nomad-driver-podman) (binaries only) |
| [![Container Repository on Quay](https://quay.io/repository/travier/nomad-fedora/status "Container Repository on Quay")](https://quay.io/repository/travier/nomad-fedora) | [nomad-fedora](https://github.com/travier/quay-containerfiles/tree/nomad-fedora) | [Nomad](https://www.nomadproject.io/) binary with [podman driver](https://github.com/hashicorp/nomad-driver-podman), based on Fedora's container image |
