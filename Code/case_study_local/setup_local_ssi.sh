#!/bin/bash

echo "🛠️ Setting up local SSI environment..."

# Step 1: Install Docker (if not installed)
if ! command -v docker &> /dev/null; then
  echo "🔧 Installing Docker..."
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
fi

# Step 2: Install Node.js + npm (if not installed)
if ! command -v node &> /dev/null; then
  echo "🔧 Installing Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi



# Step 3: Initialize npm and install dependencies
echo "📦 Initializing smart contract project..."
npm init -y
npm install --save-dev hardhat dotenv ethers @nomicfoundation/hardhat-toolbox
npx hardhat init

EOF

# Step 4: Create .env example
cat > .env.example << 'EOF'
INFURA_PROJECT_ID=your_infura_project_id
PRIVATE_KEY=your_wallet_private_key
EOF

echo "✅ Smart contract structure is ready."
echo "👉 Please create a .env file using .env.example with your Infura Project ID and wallet private key."

# Step 5: Launch Hyperledger Indy Node in Docker
cd ..
echo "🚀 Launching Hyperledger Indy Node in Docker..."
docker run -itd --name indy-node -p 9701-9708:9701-9708 hyperledger/indy-node:latest

echo "🎉 Setup complete!"
echo "💡 To deploy the smart contract, run:"
echo "cd smart-contract && npx hardhat run scripts/deploy.js --network goerli"
