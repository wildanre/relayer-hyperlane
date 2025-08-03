#!/bin/sh

# Export environment variables
export HYP_KEY=$HYP_KEY

# Verify environment variables
if [ -z "$HYP_KEY" ]; then
    echo "Error: HYP_KEY environment variable is not set"
    exit 1
fi

echo "Starting Hyperlane Relayer..."
echo "Chains: etherlinktestnet,arbitrumsepolia,basesepolia"

# Set chain configuration paths
export HYP_CHAINS=/app/chains
export HYP_CONFIG=/app/configs

# Debug: List available chains
echo "Available chains:"
ls -la /app/chains/

echo "Available configs:"
ls -la /app/configs/

# Start the relayer with explicit registry path
exec hyperlane relayer --chains etherlinktestnet,arbitrumsepolia,basesepolia --registry /app
