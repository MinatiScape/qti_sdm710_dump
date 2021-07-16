#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:d8e855b881ae7e9dde5ec16ab4ab9cc2938a3a9f; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:11db31dd93e20aeda99ae55751db077b4b1e7cc0 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:d8e855b881ae7e9dde5ec16ab4ab9cc2938a3a9f && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
