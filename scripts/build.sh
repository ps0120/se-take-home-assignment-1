#!/bin/bash

# Build Script
# This script should contain all compilation steps for your CLI application

echo "Building CLI application..."

# For Node.js projects:
# Check if node_modules exists, if not install dependencies
if [ ! -d "node_modules" ]; then
  echo "Installing dependencies..."
  npm install
fi

# Verify the application can be executed
if node -c index.js; then
  echo "Build completed successfully"
  exit 0
else
  echo "Build failed - syntax error in index.js"
  exit 1
fi