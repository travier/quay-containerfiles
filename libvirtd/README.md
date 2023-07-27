# Container with libvirtd

Based on https://github.com/89luca89/distrobox/blob/main/docs/posts/run_libvirt_in_distrobox.md.
See also: https://discussion.fedoraproject.org/t/overlaying-libvirt-on-silverblue-kinoite-sericea-onyx-and-coreos/86312

## Running manually

Start the container with:

```
$ sudo podman run --rm -ti --systemd=true --privileged --net host quay.io/travier/libvirtd
```

For a yet unknown reason, this will not start the libvirtd daemon.

Access via OpenSSH is not yet supported.

## Running with Quadlet

TODO
