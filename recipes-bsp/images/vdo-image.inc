IMAGE_FEATURES += "debug-tweaks package-management splash hwcodecs x11-base "
EXTRA_IMAGE_FEATURES ?= "tools-debug"

inherit core-image
#inherit distro_features_check
#inherit qmake5_fixes

TOOLCHAIN_TARGET_TASK:append = "qtbase-doc"
TOOLCHAIN_HOST_TASK:append = "nativesdk-make"
TOOLCHAIN_HOST_TASK:append = "nativesdk-qtscxml nativesdk-qtscxml-tools nativesdk-qtdeclarative-tools"


rootfs_add_files() {
  #
  # license manifest
  #
  # the license manifest file path inside the rootfs
  # needs to be kept in sync with the application
  #
  filename=${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
  destfile=${IMAGE_ROOTFS}/etc/license-manifest.txt
  if [ -e ${filename} ]
  then
    cp ${filename} ${destfile}
  else
    echo "no manifest information" > ${destfile}
  fi

  #
  # defaults for timezone
  #
  rm -f ${IMAGE_ROOTFS}/etc/timezone
  rm -f ${IMAGE_ROOTFS}/etc/localtime
  echo "Europe/Berlin" > ${IMAGE_ROOTFS}/etc/timezone
  ln -s /usr/share/zoneinfo/Europe/Berlin ${IMAGE_ROOTFS}/etc/localtime

  #
  # image build id
  #
  currentdir=`pwd`
  cd ${BSPDIR}/yocto/meta-smartterminal
  git rev-parse --short HEAD > ${IMAGE_ROOTFS}/etc/build_id
  cd ${currentdir}
}


ROOTFS_POSTPROCESS_COMMAND += "rootfs_add_files; "

IMAGE_INSTALL:append = "\
	bash \
	dhcpcd \
	dosfstools \
	e2fsprogs \
	e2fsprogs-tune2fs \
	evtest \
	gdbserver \
	fontconfig-utils \
	haveged \
	i2c-tools \
	iw \
	kmod \
	lighttpd \
	lsof \
	mmc-utils \
	ntp \
	openssh \
	openssh-sftp \
	openssh-sftp-server \
	openssl \
	packagegroup-fonts-truetype-core \
	powertop \
	rauc \
	rsync \
	tar \
	ttf-dejavu-serif \
	tzdata \
	tzdata-europe \
	u-boot-fw-utils \
	udev-rules-vdo-terminal \
	udisks2 \
	usbutils \
	util-linux-fsck \
	util-linux-mkfs \
	watchdog \
	wpa-supplicant \
	userland \
"

IMAGE_INSTALL:append = "\
	libnfc \
	libfreefare \
	pcsc-lite \
	pcsc-lite-lib \
	"

IMAGE_INSTALL:append = "\
	qtquickcontrols \
	qtbase-plugins \
	qtimageformats \
	qtdeclarative-qmlplugins \
	qtquickcontrols-qmlplugins \
	qtquickcontrols2 \
	qtquickcontrols2-qmlplugins \
	qtgraphicaleffects \
	qtscript \
	qtserialport \
	qtmultimedia \
	qtconnectivity \
	"
	

IMAGE_INSTALL:append = "\
    u-boot \
    kernel-devicetree \
    kernel-modules \
    kernel-image \
    rpi-rauc-boot-selection-scr \
    "	

#    linux-raspberrypi
    
