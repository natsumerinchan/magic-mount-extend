## Magic mount extend

A simple module that enable ability for modules to magic mount more partitions


### How to use

- All contents in `/data/adb/modules/$MODNAME/$PARTNAME` will be merged into `$PARTNAME` systemlessy

- Extended to these partitions:

```
/odm
/odm_dlkm
/vendor_dlkm
/cust
/my_*
```

### Important

1. Remember to clone attributes from `$PARTNAME` to `/data/adb/modules/$MODNAME/$PARTNAME`
2. Behavior of replacing and deleting is following [overlayfs-styled magic-mount](https://github.com/HuskyDG/magic-mount)
