#!/bin/bash

sleep 5  # Waits 5 seconds.
sudo pm2 start /opt/te5t/bin/www --watch
