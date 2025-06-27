#!/bin/bash
# Deployment script for Salesforce metadata using Salesforce CLI and MCP

# Exit on error
set -e

# Manifest file for deployment
MANIFEST="manifest/package.xml"

# Org alias or username (update if needed)
ORG_ALIAS="rohitdotnet555@agentforce.com"

# Deploy metadata using manifest and run only EmployeeControllerTest
npx @salesforce/cli deploy metadata --manifest "$MANIFEST" --target-org "$ORG_ALIAS" --wait 10 --test-level RunSpecifiedTests --tests EmployeeControllerTest

echo "Deployment complete!"
