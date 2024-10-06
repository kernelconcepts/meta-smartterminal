setenv SAVEENV 0
test -n "${BOOT_ORDER}" || setenv BOOT_ORDER "A B" && setenv SAVEENV 1
test -n "${BOOT_A_LEFT}" || setenv BOOT_A_LEFT 3 && setenv SAVEENV 1
test -n "${BOOT_B_LEFT}" || setenv BOOT_B_LEFT 3 && setenv SAVEENV 1
if test ${SAVEENV} -gt 0; then
  saveenv
fi

echo "##################################"
echo "## RAUC UPDATER"
echo "##################################"

setenv bootargs
for BOOT_SLOT in "${BOOT_ORDER}"; do
  if test "x${bootargs}" != "x"; then
    # skip remaining slots
  elif test "x${BOOT_SLOT}" = "xA"; then
    if test ${BOOT_A_LEFT} -gt 0; then
      setexpr BOOT_A_LEFT ${BOOT_A_LEFT} - 1
      echo "Found valid slot A, ${BOOT_A_LEFT} attempts remaining"
      run default_bootargs
      setenv bootargs "${bootargs_pi} root=/dev/mmcblk0p2 rauc.slot=A rootwait rootfstype=ext4"
    fi
  elif test "x${BOOT_SLOT}" = "xB"; then
    if test ${BOOT_B_LEFT} -gt 0; then
      setexpr BOOT_B_LEFT ${BOOT_B_LEFT} - 1
      echo "Found valid slot B, ${BOOT_B_LEFT} attempts remaining"
      run default_bootargs
      setenv bootargs "${bootargs_pi} root=/dev/mmcblk0p3 rauc.slot=B rootwait rootfstype=ext4"
    fi
  fi
done

if test -n "${bootargs}"; then
#  saveenv
else
  echo "No valid slot found, resetting tries to 3"
  setenv BOOT_A_LEFT 3
  setenv BOOT_B_LEFT 3
  saveenv
  reset
fi

