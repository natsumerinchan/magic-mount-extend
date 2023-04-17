MODPATH="${0%/*}"

MAGIC_MOUNT="$MODPATH/magic-mount"

MODULE_LIST=""

for i in $(ls /data/adb/modules); do
    if [ -e "/data/adb/modules/$i/disable" ] || [ -e "/data/adb/modules/$i/remove" ]; then
        continue
    fi
    MODULE_LIST="$i $MODULE_LIST"
done

magic_mount(){
    local part="/$1"
    if [ ! -d "$part" ] || [ -L "$part" ]; then
        return 1
    fi
    local list=""
    for i in $MODULE_LIST; do
        [ -d "/data/adb/modules/$i/$1" ] && list="/data/adb/modules/$i/$1 $list"
    done
    [ ! -z "$list" ] && "$MAGIC_MOUNT" -r $list "$part" "$part"
}

cd / || exit
for i in odm \
             odm_dlkm \
             vendor_dlkm \
             cust \
             my_*; do
    magic_mount "$i"
done


