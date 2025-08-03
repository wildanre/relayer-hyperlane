#!/bin/sh

# Export environment variables
export HYP_KEY=$HYP_KEY

# Verify environment variables
if [ -z "$HYP_KEY" ]; then
    echo "Error: HYP_KEY environment variable is not set"
    exit 1
fi

echo "Starting Hyperlane Relayer..."
echo "Chains: etherlinktestnet,arbitrumsepolia"

# Start the relayer
exec hyperlane relayer --chains etherlinktestnet,arbitrumsepolia
