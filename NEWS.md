# googleComputeEngineR 0.1.0.9000

## Changes

- Update website
- Add R-Datalab Dockerfile example
- Let Rstudio users be added with staff rights so they can install packages etc.
- Add ability to specify disk size when creating a VM (#38) - thanks @jburos
- Add firewall functions (#34)
- Add a builder template to build docker images on a dedicated VM (#32)
- Add global operation class
- Add `open_webports` argument to `gce_vm` that will open web ports 80 and 443 if necessary
- Add GPU functions
- Migrate to use `system2` instead of `system` for cross-platform SSH (#35)

# googleComputeEngineR 0.1.0

## Major changes

- Start, stop and restart VMs
- Create instances using cloudinit
- Browser based SSH
- SSH from R
- Metadata
- Docker
- Google container registry
- VM templates
- Future asynch cluster computing