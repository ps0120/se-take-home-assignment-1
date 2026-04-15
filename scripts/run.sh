#!/bin/bash
node index.js
#!/bin/bash

# Run Script
# This script should execute your CLI application and output results to result.txt

echo "Running CLI application..."

# For Node.js projects:
# Run the CLI application with sample commands
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

sleep 2

echo "CLI application execution completed"

# Display results
if [ -f "scripts/result.txt" ]; then
  echo "Results saved to scripts/result.txt"
  echo "------- Output -------"
  cat scripts/result.txt
fi
