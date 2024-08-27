SUMMARY = "Linux Kernel for VDO Terminal 4, based on the Raspberry-PI 3B+"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
DEPENDS += "lz4-native"

COMPATIBLE_MACHINE_vdo-smartterminal = "(vdo-smartterminal)"

LINUX_VERSION = "6.6.22"

SRCREV = "ba0f2212e0e100ee16bdde76b7efca6bb8ee9446"

SRC_URI += "file://vdo-terminal-4-i2c-gpio-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-i2c-rtc-gpio-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-i2c-edt-ft5406-gpio-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-pwm-2chan-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-pwm-backlight-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://vdo-terminal-4-dpi18-overlay.dts;subdir=git/arch/${ARCH}/boot/dts/overlays \
            file://defconfig \
            file://rauc.cfg \
"

KERNEL_DEVICETREE += "overlays/vdo-terminal-4-i2c-gpio.dtbo \
                      overlays/vdo-terminal-4-i2c-rtc-gpio.dtbo \
                      overlays/vdo-terminal-4-i2c-edt-ft5406-gpio.dtbo \
                      overlays/vdo-terminal-4-pwm-2chan.dtbo \
                      overlays/vdo-terminal-4-pwm-backlight.dtbo \
                      overlays/vdo-terminal-4-dpi18.dtbo \
"

KERNEL_MODULE_AUTOLOAD += "i2c-dev rtc-ds1307"

CMDLINE:append = " consoleblank=0  vt.global_cursor_default=0"
