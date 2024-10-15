PACKAGECONFIG:append = " qt5"

PACKAGES+=" libavahi-qt5"
FILES:libavahi-qt5 = "${libdir}/libavahi-qt5.so.*"
LICENSE:libavahi-qt5 = "LGPL-2.1-or-later"
