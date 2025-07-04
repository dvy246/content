#!/bin/bash

# Divy Yadav Portfolio - Development Server Startup Script

echo "🚀 Starting Divy Yadav Portfolio Development Server..."
echo "📦 Checking dependencies..."

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

echo "🔧 Starting Vite development server..."
echo "🌐 The application will be available at http://localhost:5173"
echo "🔒 Admin panel will be available in the bottom-right corner"
echo "⚡ Press Ctrl+C to stop the server"

# Start the development server
npx vite --host 0.0.0.0 --port 5173