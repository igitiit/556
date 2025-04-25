#!/bin/bash

# Define the Packer file to modify
PACKER_FILE="template.json"

# Define new values for the variables
NEW_REGION="us-west-2"
NEW_INSTANCE_TYPE="t2.large"

# Check if the file exists
if [[ ! -f "$PACKER_FILE" ]]; then
  echo "File $PACKER_FILE does not exist."
  exit 1
fi

# Using sed to update the values in the JSON file
echo "Updating region and instance type in $PACKER_FILE..."

# Update the value of the `region` variable in the JSON file
sed -i.bak '/"variables": {/,/}/s/"region": "[^"]*"/"region": "'"${NEW_REGION}"'"/' "$PACKER_FILE"

# Update the value of the `instance_type` variable in the JSON file
sed -i.bak '/"variables": {/,/}/s/"instance_type": "[^"]*"/"instance_type": "'"${NEW_INSTANCE_TYPE}"'"/' "$PACKER_FILE"

echo "Update complete."

# Clean up the backup file created by sed
rm -f "${PACKER_FILE}.bak"