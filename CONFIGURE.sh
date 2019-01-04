#!/usr/bin/env bash
# If you are executing this script in cron with a restricted environment,
# modify the shebang to specify appropriate path; /bin/bash in most distros.
# And, also if you aren't comfortable using(abuse?) env command.
PATH="$PATH:/usr/bin:/usr/local/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin"
chmod 755 ./*.sh

cp ./dcr-mount.sh /usr/local/bin/

# Systemd unit file for dcr automount/unmount 
cp ./dcr-mount@.service /etc/systemd/system/dcr-mount@.service

# Create udev rule to start/stop dcr-mount@.service on hotplug/unplug
cp ./90-dcr-mount.rules /etc/udev/rules.d/

touch /var/log/dcr-mount.track

systemctl daemon-reload
udevadm control --reload-rules
systemctl enable dcr-mount@.service
