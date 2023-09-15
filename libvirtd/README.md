# Container with libvirtd

Based on https://github.com/89luca89/distrobox/blob/main/docs/posts/run_libvirt_in_distrobox.md.
See also: https://discussion.fedoraproject.org/t/overlaying-libvirt-on-silverblue-kinoite-sericea-onyx-and-coreos/86312

## Running manually

Start the container as root with:

```
# podman run -d \
  --systemd=true \
  --privileged \
  --rm \
  --net host \
  --hostname libvirt \
  --name libvirtd \
  -v /dev/kvm:/dev/kvm \
  -v /var/lib/libvirt:/var/lib/libvirt \
  -v libvirtd_etc:/etc/libvirt \
  -v /var/roothome/.ssh/authorized_keys:/root/.ssh/authorized_keys \
  quay.io/travier/libvirtd
```

If you don't store all your images in the default location in
`/var/lib/livbirt/images`, then you can pass additional mounts:

```
  -v </path/to/where/you/store/your/images>:</foo/bar/> \
```

You can then setup your ssh config:

```
Host libvirtd.local
    Hostname localhost
    User root
    Port 2222
    IdentityFile ~/.ssh/keys/localroot
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
```

to use with the remote connection in virt-manager.

## Current issues

- The libvirtd daemon won't start directly, only on the first connection.
- The dbus-broker and systemd-journald service don't start directly in the
  container.
- DHCP does not work for virtual networks.
- Passing the full `/dev` to the container (to share USB devices for examples)
  results in the following error on VM start:
  ```
  QEMU Driver error : failed to umount devfs on /dev: Device or resource busy
  ```

## Running with Quadlet

TODO
