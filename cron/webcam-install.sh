#!/bin/sh

cp webcam.service webcam.timer ~/.config/systemd/user/
systemctl enable webcam.timer --user
