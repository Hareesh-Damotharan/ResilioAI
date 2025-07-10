#!/bin/bash

# Get current date for log file
DATE=$(date '+%Y-%m-%d')
LOG_FILE="../logs/system_health_$DATE.log"

echo "ResilioAI - System Health Check [$DATE]" > $LOG_FILE
echo "----------------------------------------" >> $LOG_FILE

# Disk Usage
echo "📦 Disk Usage:" >> $LOG_FILE
df -h >> $LOG_FILE
echo "" >> $LOG_FILE

# Memory Usage
echo "🧠 Memory Usage:" >> $LOG_FILE
free -m >> $LOG_FILE
echo "" >> $LOG_FILE

# CPU Load
echo "⚙️ CPU Load:" >> $LOG_FILE
uptime >> $LOG_FILE
echo "" >> $LOG_FILE

# Check if Splunk is running
echo "🔍 Splunk Process Status:" >> $LOG_FILE
if pgrep -x "splunkd" > /dev/null
then
    echo "✅ Splunkd is running." >> $LOG_FILE
else
    echo "❌ Splunkd is NOT running!" >> $LOG_FILE
fi

echo "" >> $LOG_FILE
echo "✅ Health check completed." >> $LOG_FILE
