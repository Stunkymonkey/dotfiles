#!/bin/sh

cp borg-notify.service borg-notify.timer ~/.config/systemd/user/
systemctl enable borg-notify.timer --user
