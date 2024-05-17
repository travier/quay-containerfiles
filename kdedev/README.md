# Container for KDE developement

Everything you need for KDE development on Fedora, in a container to use with
toolbox or distrobox.

## Usage

Create a toolbox or distrobox container from this image:

```
$ toolbox create --image ...
```

Enter the container:

```
$ toolbox enter kdedev
```

Setup your kdesrc-build configuration:

```
$ kdesrc-build --initial-setup
```

Follow KDE's documentation to build KDE software:
[Building KDE software with kdesrc-build](https://develop.kde.org/docs/getting-started/building/kdesrc-build-compile/)

## Updates

As everything is then stored in your home directory which is shared with the
container, it should be safe to delete and re-create this container regularly
to get updated dependencies.

```
$ toolbox rm --force kdedev
$ podman pull ...
$ toolbox create --image ...
```
