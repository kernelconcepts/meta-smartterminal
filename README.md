# meta-smartterminal

Yocto BSP und meta Layer for VDO SmartTerminal


## Yocto image build

For an image build, use a Linux distribution supported by the
Yocto project. To fetch all necessary sources and do an image
build, follow these steps:

```
repo init -u git@github.com:kernelconcepts/meta-smartterminal
. setup-environment build
[yocto] bitbake vdo-image
```

For an update bundle, do the following:

```
[yocto] bitbake vdo-bundle
```

After successful build, find the build results within the
`tmp/deploy/images/vdo-smartterminal/` subdirectory of the
build folder.

The WIC-Image is a full system image to be flashed onto
the device.

The RAUCB-File is an update bundle.
