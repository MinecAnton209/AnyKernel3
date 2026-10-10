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

# Staged install. The banner/version files above are printed by
# update-binary itself; here each phase moves the recovery bar via
# show_progress and echoes one clean line.

phase() { # $1 = fraction, $2.. = label
  local frac="$1"; shift;
  show_progress "$frac" 10;
  ui_print "  $*";
}

phase 0.05 "Reading current boot image";
dump_boot;
phase 0.30 "Boot image ready";
phase 0.50 "Writing new kernel";
write_boot;
phase 0.85 "Checking boot partition";
[ -e "$BLOCK" ] || abort "Boot partition missing after flash. Aborting...";
phase 1.00 "Install complete";

ui_print " ";
ui_print "  Reboot to boot into the new kernel.";
ui_print "  Root tip - play on cable without battery heat:";
ui_print "    find /sys -name bypass_charging";
ui_print "    echo 1 > <found-path>  (0 restores charging)";
ui_print " ";
## end boot install
