#!/bin/sh

VENDOR=mediacom
DEVICE=PhonePadDuo

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

echo "Pulling $DEVICE files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
mkdir -p $BASE/$DIR
    fi

adb pull /system/$FILE $BASE/$FILE

done

adb pull /system/lib/hw/audio_policy.default.so $BASE/lib/hw/audio_policy.mt6589.so
adb pull /system/lib/hw/libaudio.r_submix.default.so $BASE/lib/hw/audio.r_submix.mt6589.so

./setup-makefiles.sh
