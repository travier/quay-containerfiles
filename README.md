# Containerfiles for various personal projects

Those containers are built using GitHub Actions and hosted on Quay.io and most
of them are Fedora based. Some might require volume mounts or manual
configuration.

Each `Containerfile` is in a specific folder in this repo.

All repositories are under the [travier](https://quay.io/user/travier)
namespace.

## Service containers

| Quay.io repository | Description |
|-|-|
| [php-fpm-ttrss](https://quay.io/repository/travier/php-fpm-ttrss) | [PHP-FPM](https://www.php.net/manual/en/install.fpm.php) and modules for [Tiny Tiny RSS](https://tt-rss.org/) |
| [unbound](https://quay.io/repository/travier/unbound) | [Unbound](https://www.nlnetlabs.nl/projects/unbound/about/) |
| [nginx](https://quay.io/repository/travier/nginx) | [nginx](https://nginx.org/) |

## Toolbox containers

| Quay.io repository | Description |
|-|-|
| [toolbox](https://quay.io/repository/travier/toolbox) | Personal toolbox container image based on the Fedora toolbox image for general use cases |
| [toolbox-kdedev](https://quay.io/repository/travier/toolbox-kdedev) | Toolbox container image based on the Fedora toolbox image for KDE development |
| [toolbox-texlive](https://quay.io/repository/travier/toolbox-texlive) | Toolbox container image based on Fedora for LaTeX based projects |

## Hashicorp projects

Moved to [github.com/travier/hashicorp-container-images](https://github.com/travier/hashicorp-container-images).

## License

See [LICENSE](LICENSE).
