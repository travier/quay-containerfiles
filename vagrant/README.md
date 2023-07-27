# Vagrant with libvirt support

Use in combination with the following alias:

```
vagrant() {
  mkdir -p ~/.vagrant.d/boxes ~/.vagrant.d/data ~/.vagrant.d/tmp
  podman run -it --rm \
    -e LIBVIRT_DEFAULT_URI \
    -e LIBGUESTFS_BACKEND=direct \
    -v /run/libvirt/:/run/libvirt/ \
    -v /var/lib/libvirt/images:/var/lib/libvirt/images/ \
    -v ~/.vagrant.d/boxes:/vagrant/boxes \
    -v ~/.vagrant.d/data:/vagrant/data \
    -v ~/.vagrant.d/tmp:/vagrant/tmp \
    -v $(realpath "${PWD}"):${PWD} \
    -w $(realpath "${PWD}") \
    --network host \
    --entrypoint /bin/bash \
    --security-opt label=disable \
    quay.io/travier/vagrant:latest \
      vagrant $@
}
```
