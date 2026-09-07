#!/usr/bin/env bash
set -e

echo "====================================================="
echo "  🚀 Flutter Exp 1 - GitHub Push & Deploy Helper  "
echo "====================================================="

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📌 Initializing Git repository..."
    git init
    git branch -M main
fi

# Stage all files
echo "📌 Staging files..."
git add .

# Prompt or use default commit message
commit_msg=${1:-"Initial commit: Flutter Experiment 1 Student Profile App"}
echo "📌 Creating commit: '$commit_msg'..."
git commit -m "$commit_msg" || echo "No changes to commit."

# Check if remote origin exists
if git remote | grep -q "^origin$"; then
    echo "📌 Current remote origin:"
    git remote get-url origin
else
    echo ""
    echo "====================================================="
    echo "Enter your GitHub repository URL:"
    echo "Example: https://github.com/your-username/flutter-widget-layout.git"
    echo "====================================================="
    read -p "Repository URL: " repo_url
    if [ -n "$repo_url" ]; then
        git remote add origin "$repo_url"
        echo "✅ Remote origin added: $repo_url"
    else
        echo "⚠️ No repository URL provided. You can add it later using:"
        echo "   git remote add origin <your-repo-url>"
        echo "   git push -u origin main"
        exit 0
    fi
fi

echo ""
echo "🚀 Pushing code to GitHub (main branch)..."
git push -u origin main

echo ""
echo "====================================================="
echo "🎉 Code successfully pushed to GitHub!"
echo "GitHub Actions will automatically build and deploy your Flutter app to GitHub Pages."
echo "Check progress under the 'Actions' tab in your GitHub repository."
echo "====================================================="
