#!/sbin/sh

good_ffc_device() {
  if [ -f /sdcard/.forcefaceunlock ]; then
    return 0
  fi
  if cat /proc/cpuinfo |grep -q Victory; then
    return 1
  fi
  if cat /proc/cpuinfo |grep -q herring; then
    return 1
  fi
  if cat /proc/cpuinfo |grep -q sun4i; then
    return 1
  fi
  return 0
}

if good_ffc_device && [ -e /system/etc/permissions/android.hardware.camera.front.xml ]; then
  echo "Installing face detection support"
  rm  -f /system/addon.d/71-gapps-faceunlock.sh
  cp -a /tmp/face/* /system/
  chmod 755 /system/addon.d/71-faceunlock.sh
elif  [ -d /system/vendor/pittpatt/ ]; then
  rm -rf /system/vendor/pittpatt/
  rm  -f /system/app/FaceLock.apk
  rm  -f /system/app/FaceLock.odex
  rm  -f /system/lib/libfacelock_jni.so
  rm  -f /system/addon.d/71-gapps-faceunlock.sh
  rm  -f /system/addon.d/71-faceunlock.sh
fi
rm -rf /tmp/face

if (grep -qi "hammerhead" /proc/cpuinfo ); then
  echo "Installing Nexus 5 Photosphere Camera"
  rm -f /system/app/Camera2.apk
  rm -f /system/priv-app/Camera2.apk
  rm -f /system/app/Gallery.apk
  rm -f /system/priv-app/Gallery.apk
  rm -f /system/app/Gallery2.apk
  rm -f /system/priv-app/Gallery2.apk
  cp -a /tmp/photosphere/common/* /system/
  cp -a /tmp/photosphere/hammerhead/* /system/
  chmod 755 /system/addon.d/74-googlecamera.sh
fi

if (grep -qi "deb" /proc/cpuinfo )||(grep -qi "flo" /proc/cpuinfo ); then
  echo "Installing Nexus 7 Photosphere Camera"
  rm -f /system/app/Camera2.apk
  rm -f /system/priv-app/Camera2.apk
  rm -f /system/app/Gallery.apk
  rm -f /system/priv-app/Gallery.apk
  rm -f /system/app/Gallery2.apk
  rm -f /system/priv-app/Gallery2.apk
  cp -a /tmp/photosphere/common/* /system/
  cp -a /tmp/photosphere/razor/* /system/
  chmod 755 /system/addon.d/74-googlecamera.sh
fi

if (grep -qi "mako" /proc/cpuinfo ); then
  echo "Installing Nexus 4 Photosphere Camera"
  rm -f /system/app/Camera2.apk
  rm -f /system/priv-app/Camera2.apk
  rm -f /system/app/Gallery.apk
  rm -f /system/priv-app/Gallery.apk
  rm -f /system/app/Gallery2.apk
  rm -f /system/priv-app/Gallery2.apk
  cp -a /tmp/photosphere/common/* /system/
  cp -a /tmp/photosphere/mako/* /system/
  chmod 755 /system/addon.d/74-googlecamera.sh
fi

if (grep -qi "manta" /proc/cpuinfo ); then
  echo "Installing Nexus 10 Photosphere Camera"
  rm -f /system/app/Camera2.apk
  rm -f /system/priv-app/Camera2.apk
  rm -f /system/app/Gallery.apk
  rm -f /system/priv-app/Gallery.apk
  rm -f /system/app/Gallery2.apk
  rm -f /system/priv-app/Gallery2.apk
  cp -a /tmp/photosphere/common/* /system/
  cp -a /tmp/photosphere/manta/* /system/
  chmod 755 /system/addon.d/74-googlecamera.sh
fi

rm -rf /tmp/photosphere