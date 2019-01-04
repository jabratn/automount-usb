#!/usr/bin/env bash
# If you are executing this script in cron with a restricted environment,
# modify the shebang to specify appropriate path; /bin/bash in most distros.
# And, also if you aren't comfortable using(abuse?) env command.
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"

# Just a best effort
rm -f /usr/local/bin/dcr-mount.sh

# Systemd unit file for DCR automount/unmount 
rm -f /etc/systemd/system/dcr-mount@.service

# Remove the track files
rm -f /var/log/dcr-mount.track*

# Remove udev rule
rm /etc/udev/rules.d/90-dcr-mount.rules
#sed -i "/systemctl\sstart\sdcr-mount/d" /etc/udev/rules.d/90-dcr.rules
#sed -i "/systemctl\sstop\sdcr-mount/d" /etc/udev/rules.d/90-dcr.rules

systemctl daemon-reload
udevadm control --reload-rules
