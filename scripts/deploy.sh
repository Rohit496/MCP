#!/bin/bash
# Deployment script for Salesforce metadata using Salesforce CLI and MCP

# Exit on error
set -e

# Directory containing the source to deploy
SRC_DIR="force-app/main/default"

# Org alias or username (update if needed)
ORG_ALIAS="rohitdotnet555@agentforce.com"

# Deploy metadata
npx @salesforce/cli deploy metadata --source-dir "$SRC_DIR" --target-org "$ORG_ALIAS" --wait 10

echo "Deployment complete!"
