#!/bin/bash
service cron start
exec gosu steam /app/start.sh
