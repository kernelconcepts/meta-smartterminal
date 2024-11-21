FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "\
	file://powersave.sh \
	"

do_install:append () {
    install -m 0755  ${S}/powersave.sh  ${D}${sysconfdir}/init.d
    update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
}
