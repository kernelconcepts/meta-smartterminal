# VDO SmartTerminal RAUC bundle

inherit bundle

# If you change this keep RAUC system.conf in sync
RAUC_BUNDLE_COMPATIBLE = "${MACHINE}"

RAUC_BUNDLE_SLOTS = "rootfs"
RAUC_SLOT_rootfs = "vdo-image"

RAUC_KEY_FILE = "${THISDIR}/../../openssl-ca/dev/private/development-1.key.pem"
RAUC_CERT_FILE = "${THISDIR}/../../openssl-ca/dev/development-1.cert.pem"
