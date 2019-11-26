DESCRIPTION = "VDO SmartTerminal - RootFS Image"
SUMMARY  = "Image for VDO SmartTerminal"

LICENSE = "MIT"

inherit populate_sdk_qt5

require vdo-image.inc

IMAGE_INSTALL_append = "\
	vdo-smartterminal-fw \
"
