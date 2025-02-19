#!/bin/bash
#
# Modify the buildroot target files before they are packed into the final
# images
#

# Add config and 9p mounts used for CCA demos
if ! grep -q "shr0" $TARGET_DIR/etc/fstab; then
    cat << EOF >> $TARGET_DIR/etc/fstab
    configfs    /sys/kernel/config      configfs    defaults        0       0
    debugfs     /sys/kernel/debug       debugfs     defaults        0       0
    shr0        /mnt/                   9p          nofail          0       0
    FM          /mnt/                   9p          nofail          0       0
EOF
fi

# Add address for Linaro veraison verifier
if ! grep -q "veraison" $TARGET_DIR/etc/hosts; then
    cat << EOF >> $TARGET_DIR/etc/hosts
    # This service is provided for development purposes only as detailed here:
    # http://veraison.test.linaro.org/disclaimer.html
    213.146.141.101        veraison.example
EOF
fi

script_path=$(dirname -- "${BASH_SOURCE[0]}")
install -DT "$script_path/init-tap.sh" "$TARGET_DIR/etc/init.d/S50macvtap"
