# Debian Boot USB Preparation

1. Edit the Boot Parameters on the USB

    Insert the USB into another computer and navigate to the boot folder.

    Locate the file syslinux.cfg, txt.cfg, or similar within the USB’s boot folder.

    Add to the `append` line (eg. `append initrd=/install.amd/initrd.gz`) with the following to the boot parameters to enable preseed (replace preseed url):

    ```cfg
    auto=true priority=critical preseed/url=http://p1.local/n40l_preseed.cfg
    ```

2. Boot it up

    Plug it the USB stick, power it up, hope for the best

    If it doesn't work, troubleshoot using logs at these locations:

    ```sh
    /var/log/syslog
    /var/log/partman
    /var/log/installer/debug
    /var/log/installer/cdebconf/questions.dat
    /var/log/installer/target/var/log/apt/term.log
    /var/log/installer/dmesg
    /var/log/installer/target/boot/grub/grub.cfg
    ```
