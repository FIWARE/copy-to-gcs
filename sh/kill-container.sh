#!/bin/bash -e

echo "Copy failed. Kill container."
kill -9  `pgrep -f cron`
