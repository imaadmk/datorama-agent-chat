#!/bin/bash
# Automated GitHub Pages Deployment Script for Datorama Chat Widget

set -e

echo "========================================="
echo "Datorama Agent Chat - GitHub Pages Deploy"
echo "========================================="
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    exit 1
fi

# Check if gh CLI is installed (optional)
if command -v gh &> /dev/null; then
    USE_GH_CLI=true
    echo "✓ GitHub CLI detected - will use for repo creation"
else
    USE_GH_CLI=false
    echo "ℹ️  GitHub CLI not found - you'll need to create repo manually"
fi

echo ""
echo "This script will:"
echo "1. Initialize git repository"
echo "2. Create GitHub repository (if gh CLI available)"
echo "3. Push code to GitHub"
echo "4. Enable GitHub Pages"
echo ""

read -p "Continue? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 0
fi

# Get GitHub username
echo ""
read -p "Enter your GitHub username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ GitHub username is required"
    exit 1
fi

REPO_NAME="datorama-agent-chat"

echo ""
echo "📦 Repository will be: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    echo "🔧 Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit: Datorama Agentforce chat widget"
    echo "✓ Git repository initialized"
else
    echo "✓ Git repository already initialized"
fi

# Create GitHub repo if gh CLI is available
if [ "$USE_GH_CLI" = true ]; then
    echo ""
    echo "🚀 Creating GitHub repository..."

    if gh repo create "$REPO_NAME" --public --source=. --remote=origin --push; then
        echo "✓ Repository created and code pushed"

        # Enable GitHub Pages
        echo ""
        echo "🌐 Enabling GitHub Pages..."
        sleep 2
        gh api repos/$GITHUB_USERNAME/$REPO_NAME/pages -X POST \
            -F source[branch]=main -F source[path]=/

        echo ""
        echo "========================================="
        echo "✅ DEPLOYMENT SUCCESSFUL!"
        echo "========================================="
        echo ""
        echo "🌐 Your chat widget will be live at:"
        echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
        echo ""
        echo "⏱️  Note: First deployment takes 2-3 minutes to go live"
        echo ""
        echo "📋 Next steps:"
        echo "   1. Wait 2-3 minutes for GitHub Pages to deploy"
        echo "   2. Test your chat: https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
        echo "   3. Embed in Datorama using iframe (see README.md)"
        echo ""
    else
        echo "❌ Failed to create repository"
        exit 1
    fi
else
    # Manual GitHub repo creation
    echo ""
    echo "📝 Manual Setup Required:"
    echo ""
    echo "1. Go to: https://github.com/new"
    echo "2. Repository name: $REPO_NAME"
    echo "3. Make it Public"
    echo "4. Do NOT initialize with README"
    echo "5. Click 'Create repository'"
    echo ""
    read -p "Press Enter when you've created the repository..."

    echo ""
    echo "🔗 Connecting to GitHub..."
    git remote add origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git" 2>/dev/null || \
    git remote set-url origin "https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

    echo "📤 Pushing code..."
    git branch -M main
    git push -u origin main

    echo ""
    echo "========================================="
    echo "✅ CODE PUSHED SUCCESSFULLY!"
    echo "========================================="
    echo ""
    echo "🌐 Enable GitHub Pages:"
    echo "   1. Go to: https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
    echo "   2. Source: main branch"
    echo "   3. Click Save"
    echo ""
    echo "⏱️  Your chat will be live at:"
    echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
    echo "   (2-3 minutes after enabling Pages)"
    echo ""
fi

echo "📖 See README.md for embedding instructions"
echo ""
