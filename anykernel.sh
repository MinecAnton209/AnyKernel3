### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers
## miatoll flavor by MinecAnton209

### AnyKernel setup
# global properties
properties() { '
kernel.string=MinecAnton209 Kernel for Redmi Note 9 Pro (miatoll)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=miatoll
device.name2=curtana
device.name3=joyeuse
device.name4=gram
device.name5=excalibur
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


### AnyKernel install
## boot files attributes
#boot_attributes() {
#set_perm_recursive 0 0 755 644 $RAMDISK/*;
#set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
#} # end attributes

# boot shell variables
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=0;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# miatoll pretty installer
ui_print " ";
ui_print "-- MinecAnton209 kernel for miatoll --";
ui_print "  DualSense  |  fsync  |  BBR  |  bypass charging";
ui_print " ";

step() { # $1 = fraction 0..1, $2.. = message
  local frac="$1"; shift;
  show_progress "$frac" 0;
  ui_print "  [ ok ] $*";
}

step 0.05 "Checking device...";
dump_boot;
step 0.45 "Boot image unpacked, flashing kernel...";
write_boot;
step 0.90 "Cleaning up...";

ui_print " ";
ui_print "  Done! Reboot and enjoy.";
ui_print "  bypass_charging: echo 1 > <smb5>/bypass_charging";
ui_print " ";
## end boot install
