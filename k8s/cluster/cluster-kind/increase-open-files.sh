#!/bin/bash
#

echo
echo
echo '=========================================================================='
echo " Increasing the number of open files for the cluster nodes to prevent 'too many open files' errors."
echo '=========================================================================='
sudo sysctl -w fs.inotify.max_user_watches=2099999999
sudo sysctl -w fs.inotify.max_user_instances=2099999999
sudo sysctl -w fs.inotify.max_queued_events=2099999999