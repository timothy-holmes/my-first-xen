# Debian Boot USB Preparation

1. Edit the Boot Parameters on the USB:
Insert the USB into another computer and navigate to the boot folder.

Locate the file syslinux.cfg, txt.cfg, or similar within the USB’s boot folder.

Add the following to the boot parameters to enable SSH (replace preseed url):

```cfg
auto=true priority=critical hostname=n40l locale=en_US keymap=us interface=auto
preseed/url=https://example.com/preseed.cfg
```

2. Boot it up

