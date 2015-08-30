#!/bin/bash
env > /root/env
sed -i "s/###CRON_PATTERN###/$CRON_PATTERN/g" /etc/cron.d/duplicity-cron
crond && tail -f /var/log/cron.log
