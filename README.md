# iPXE Build
This project aims to provide an easy to use environment to build a custom iPXE image.

Reasons you may want to do this:
 - Add support for an optional feature (e.g. download over HTTPS)
 - Embed an iPXE script directly into the binary
 - Build UEFI-optimized image variants instead of using the BIOS (undionly) image for all clients

To find out more about what you can do with iPXE, check out the [project homepage](https://ipxe.org).

## How to use
1. Clone and enter the repo
```bash
$ git clone https://github.com/e-nomem/ipxe-build.git
$ cd ipxe-build
```
2. Customize your build configuration
   - Enable/disable features using the header files
   - Select the targets and pass them as args to the builder in `docker-compose.yml`
   - Add your local configuration directory to the volume mounts in `docker-compose.yml`
3. Build iPXE with `make build`. All artifacts will be copied to the `./out` directory locally.
4. Repeat steps 2 and 3 as necessary

## Customization
To create a custom configuration for iPXE, create a local directory with all the iPXE configuration header files:
 - `colour.h`
 - `console.h`
 - `crypto.h`
 - `general.h`
 - `serial.h`
 - `settings.h`
 - `sideband.h`
 - `usb.h`

The header files can be empty, but they should all be present. Configure the options in each of those files as desired. See the [iPXE documentation](https://ipxe.org/buildcfg) for some commonly used build options.

### Embedding an iPXE script
To embed your iPXE image with a script, place the script in your configuration directory along side all the header files. Ensure that the script is named `embed.ipxe`.

## Troubleshooting
### The docker image is missing
The makefile tracks a local file (`.image-build-done`) to determine if the docker image needs to be rebuilt or not. If the docker image gets deleted, the Makefile will not notice. `make taint-image` will delete this hidden tracking file and force a rebuild of the image on the next run.

## How it works
The [Dockerfile](./Dockerfile) within this project creates a minimal environment that has the build dependencies installed and the iPXE source code cloned directly from the main git repo. The built container image does not contain the build script or custom configuration, and this is intentional. This way, the image does not need to be rebuilt when the build script or configuration are updated.

The [build script](./builder.sh) does the actual job of building the targets specified, including finding an embed script (if one exists), managing the cross-compilation args, and copying out the built artifacts.

The [docker-compose.yml](./docker-compose.yml) is the main file that contains all the customization. It ensures that the docker image is built, and that the external files are mounted into the correct locations within the container.
