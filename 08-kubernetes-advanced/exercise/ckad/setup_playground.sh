#!/bin/bash

set -e

echo "🚀 Setting up DevOps playground..."

# Step 1: Clone repositories
echo "📦 Cloning repositories..."
git clone https://github.com/bmuschko/ckad-crash-course.git
git clone https://github.com/nightwalker9999/devops-concepts.git

# Step 2: Configure Git identity (safe even on playground)
echo "🔧 Configuring Git identity..."
git config --global user.email "sharmaarjun99998888@gmail.com"
git config --global user.name "nightwalker"

echo "✅ Setup complete!"
echo "ℹ️ When pushing, GitHub will prompt you for your PAT (as password)."
