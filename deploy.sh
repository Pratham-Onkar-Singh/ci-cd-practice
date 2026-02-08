#!/bin/bash
set -e

echo "Restarting app..."

pm2 restart ci-cd-practice || pm2 start npm --name "ci-cd-practice" -- start
