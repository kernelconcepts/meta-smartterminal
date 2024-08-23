FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://backlight.sh \
            file://cool.sh \
"

do_install:append () {
    install -d ${D}/${sysconfdir}/init.d
    install -d ${D}/${sysconfdir}/rcS.d
    install -m 644 ${WORKDIR}/backlight.sh ${D}/${sysconfdir}/init.d
    install -m 644 ${WORKDIR}/cool.sh ${D}/${sysconfdir}/init.d
    cd ${D}/${sysconfdir}/rcS.d
    ln -s ../init.d/backlight.sh S07backlight.sh
    ln -s ../init.d/cool.sh S07cool.sh
}
