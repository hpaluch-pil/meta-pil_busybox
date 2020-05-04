# meta-pil_busybox/recipes-core/busybox/busybox_%.bbappend
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append := " file://lspci.cfg"

