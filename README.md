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
| [filebrowser](https://quay.io/repository/travier/filebrowser) | Based on [Filebrowser](https://github.com/filebrowser/filebrowser)'s official container image |
| [libvirtd](https://quay.io/repository/travier/libvirtd) | [libvirt](https://libvirt.org/) daemon to run on rpm-ostree based systems |
| [nginx](https://quay.io/repository/travier/nginx) | [nginx](https://nginx.org/) |
| [php-fpm-ttrss](https://quay.io/repository/travier/php-fpm-ttrss) | [PHP-FPM](https://www.php.net/manual/en/install.fpm.php) and modules for [Tiny Tiny RSS](https://tt-rss.org/) |
| [quasselcore](https://quay.io/repository/travier/quasselcore) | [Quassel IRC](https://quassel-irc.org/) |
| [unbound](https://quay.io/repository/travier/unbound) | [Unbound](https://www.nlnetlabs.nl/projects/unbound/about/) |

## Toolbox containers and tools

The toolbox container images are based on the Fedora toolbox container image.

| Quay.io repository | Description |
|-|-|
| [toolbox](https://quay.io/repository/travier/toolbox) | Personal toolbox for general use cases |
| [toolbox-kdedev](https://quay.io/repository/travier/toolbox-kdedev) | Tools and dependencies needed for KDE development |
| [toolbox-kdedev6](https://quay.io/repository/travier/toolbox-kdedev6) | Tools and dependencies needed for KDE 6 development |
| [toolbox-root](https://quay.io/repository/travier/toolbox-root) | Tools useful for system administration |
| [toolbox-texlive](https://quay.io/repository/travier/toolbox-texlive) | Tools and binaries to build LaTeX based projects |

## Verifying sigstore container signatures with podman

How to configure sigstore signature verification in podman:

```
$ sudo mkdir /etc/pki/containers
$ sudo cp quay-travier-containers.pub /etc/pki/containers/
$ sudo restorecon -RFv /etc/pki/containers

$ cat /etc/containers/registries.d/quay.io-travier.yaml
docker:
  quay.io/travier:
    use-sigstore-attachments: true
$ sudo restorecon -RFv /etc/containers/registries.d/quay.io-travier.yaml

$ cat /etc/containers/policy.json
{
    "default": [
        {
            "type": "reject"
        }
    ],
    "transports": {
        "docker": {
            ...
            "quay.io/travier": [
                {
                    "type": "sigstoreSigned",
                    "keyPath": "/etc/pki/containers/quay-travier-containers.pub",
                    "signedIdentity": {
                        "type": "matchRepository"
                    }
                }
            ],
            ...
            "": [
                {
                    "type": "insecureAcceptAnything"
                }
            ]
        },
        ...
    }
}
...
```

## License

See [LICENSE](LICENSE).
