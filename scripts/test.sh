#!/bin/bash

# Unit Test Script
# This script should contain all unit test execution steps

echo "Running unit tests..."

# For Go projects:
# go test ./... -v
node index.js <<EOF
new-normal
new-normal
new-vip
new-vip
status
add-bot
add-bot
remove-bot
status
exit
EOF


sleep 12

if grep -q "completed" scripts/result.txt; then
  echo "Test Passed"
  exit 0
else
  echo "Test Failed"
  exit 1
fi
# For Node.js projects:
# npm test

echo "Unit tests completed"
