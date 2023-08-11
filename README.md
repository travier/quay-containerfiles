# Containerfiles for various personal projects

Those containers are based on the Fedora container image, built using GitHub
Actions and hosted on Quay.io.

Some might require volume mounts or manual configuration. See the individual
READMEs for more information.

Each `Containerfile` is in a specific folder in this repo. All repositories are
under the [travier](https://quay.io/user/travier) namespace.

## Service containers

| Quay.io repository | Description |
|-|-|
| [php-fpm-ttrss](https://quay.io/repository/travier/php-fpm-ttrss) | [PHP-FPM](https://www.php.net/manual/en/install.fpm.php) and modules for [Tiny Tiny RSS](https://tt-rss.org/) |
| [unbound](https://quay.io/repository/travier/unbound) | [Unbound](https://www.nlnetlabs.nl/projects/unbound/about/) |
| [nginx](https://quay.io/repository/travier/nginx) | [nginx](https://nginx.org/) |
| [quasselcore](https://quay.io/repository/travier/quasselcore) | [Quassel IRC](https://quassel-irc.org/) |
| [libvirtd](https://quay.io/repository/travier/libvirtd) | [libvirt](https://libvirt.org/) daemon to run on rpm-ostree based systems |

## Toolbox containers and tools

The toolbox container images are based on the Fedora toolbox container image.

| Quay.io repository | Description |
|-|-|
| [toolbox](https://quay.io/repository/travier/toolbox) | Personal toolbox for general use cases |
| [toolbox-kdedev](https://quay.io/repository/travier/toolbox-kdedev) | Tools and dependencies needed for KDE development |
| [toolbox-root](https://quay.io/repository/travier/toolbox-root) | Tools useful for system administration |
| [toolbox-texlive](https://quay.io/repository/travier/toolbox-texlive) | Tools and binaries to build LaTeX based projects |

## License

See [LICENSE](LICENSE).
