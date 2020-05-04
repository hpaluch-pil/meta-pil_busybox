Here is simple example how to customize Busybox of Yocto Project using custom layer `meta-pil_busybox`.
The customized version adds `lspci` command to `busybox`


# Setup

Please follow setup on https://www.yoctoproject.org/docs/3.1/brief-yoctoprojectqs/brief-yoctoprojectqs.html
to prepare your Yocto Project Linux image.

The only difference is to use different image to build (the "Sato" image requires X-Window + OpenGL to work):

```bash
# you should be in `build` directory of Yocto Project
bitbake core-image-minimal
```

And if you have no X11 use this `runqemu` command:
```bash
runqemu qemux86-64 core-image-minimal nographic
```

When you run stock `core-image-minimal` you can see that there is no `lspci` command. 
To add `lspci` command do this:

```bash
# you are in `build` directory of Yocto Project
cd ..
git clone https://github.com/hpaluch-pil/meta-pil_busybox.git
cd build
bitbake-layers add-layer ../meta-pil_busybox'
```

Now rebuild image and rerun qemu:

```bash
bitbake -c cleanall busybox
bitbake core-image-minimal
runqemu qemux86-64 core-image-minimal nographic
```

There should be now `lspci` command of Busybox in this image.


# Copyright

I combined bits from these two guides to create this example layer:

* http://bec-systems.com/site/1145/modifying-the-busybox-config-in-openembedded
* https://github.com/jynik/ready-set-yocto


