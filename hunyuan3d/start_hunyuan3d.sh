#!/bin/bash

# Real Hunyuan3D-2 Server Startup Script
# Automates the setup and launch of the Hunyuan3D-2 API server

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting Real Hunyuan3D-2 Integration${NC}"
echo "======================================"

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if we're in the right directory
if [ ! -f "real_hunyuan3d_server.py" ]; then
    print_error "Please run this script from the hunyuan3d directory"
    exit 1
fi

# Check Python installation
if ! command -v python3 &> /dev/null; then
    print_error "Python 3 is not installed"
    exit 1
fi

print_status "Python 3 found: $(python3 --version)"

# Check for CUDA
if command -v nvidia-smi &> /dev/null; then
    print_status "NVIDIA GPU detected:"
    nvidia-smi --query-gpu=name,memory.total --format=csv,noheader,nounits | head -1
else
    print_warning "No NVIDIA GPU detected. Will use CPU mode."
fi

# Set default values
HOST="0.0.0.0"
PORT="8000"
MODEL_PATH="tencent/Hunyuan3D-2mini"  # Start with mini model for better compatibility
ENABLE_TEXTURE="true"
PRELOAD_MODELS="false"
AUTO_SETUP="false"

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --host)
            HOST="$2"
            shift 2
            ;;
        --port)
            PORT="$2"
            shift 2
            ;;
        --model)
            MODEL_PATH="$2"
            shift 2
            ;;
        --no-texture)
            ENABLE_TEXTURE="false"
            shift
            ;;
        --preload)
            PRELOAD_MODELS="true"
            shift
            ;;
        --setup)
            AUTO_SETUP="true"
            shift
            ;;
        --full-model)
            MODEL_PATH="tencent/Hunyuan3D-2"
            shift
            ;;
        --help)
            echo "Usage: $0 [OPTIONS]"
            echo "Options:"
            echo "  --host HOST          Server host (default: 0.0.0.0)"
            echo "  --port PORT          Server port (default: 8000)"
            echo "  --model MODEL        Model path (default: tencent/Hunyuan3D-2mini)"
            echo "  --full-model         Use full Hunyuan3D-2 model (requires more VRAM)"
            echo "  --no-texture         Disable texture generation"
            echo "  --preload            Preload models at startup"
            echo "  --setup              Run setup before starting"
            echo "  --help               Show this help message"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            exit 1
            ;;
    esac
done

echo "Configuration:"
echo "  Host: $HOST"
echo "  Port: $PORT"
echo "  Model: $MODEL_PATH"
echo "  Texture: $ENABLE_TEXTURE"
echo "  Preload: $PRELOAD_MODELS"
echo ""

# Run setup if requested
if [ "$AUTO_SETUP" = "true" ]; then
    print_status "Running automated setup..."
    python3 setup_hunyuan3d.py
fi

# Check if dependencies are installed
if [ ! -f "requirements.txt" ]; then
    print_error "requirements.txt not found"
    exit 1
fi

# Quick dependency check
python3 -c "import torch, trimesh, fastapi" 2>/dev/null || {
    print_warning "Dependencies not fully installed. Installing now..."
    pip install -r requirements.txt
}

# Check if the server script exists
if [ ! -f "real_hunyuan3d_server.py" ]; then
    print_error "real_hunyuan3d_server.py not found"
    exit 1
fi

# Set environment variables for optimal performance
export TORCH_CUDNN_V8_API_ENABLED=1
export TOKENIZERS_PARALLELISM=false

# Only set CUDA_VISIBLE_DEVICES if CUDA is available
if command -v nvidia-smi &> /dev/null; then
    export CUDA_DEVICE_ORDER=PCI_BUS_ID
    # Use all available GPUs
    export CUDA_VISIBLE_DEVICES=0
fi

print_status "Environment configured"

# Create necessary directories
mkdir -p models outputs temp gradio_cache
print_status "Directories created"

# Build server command
SERVER_CMD="python3 real_hunyuan3d_server.py --host $HOST --port $PORT --model-path $MODEL_PATH"

if [ "$ENABLE_TEXTURE" = "true" ]; then
    SERVER_CMD="$SERVER_CMD --enable-texture"
fi

if [ "$PRELOAD_MODELS" = "true" ]; then
    SERVER_CMD="$SERVER_CMD --preload-models"
fi

echo ""
print_status "Starting Real Hunyuan3D-2 Server..."
echo "Command: $SERVER_CMD"
echo ""
echo -e "${BLUE}Server will be available at: http://$HOST:$PORT${NC}"
echo -e "${BLUE}Health check: http://$HOST:$PORT/health${NC}"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Function to handle cleanup on exit
cleanup() {
    echo ""
    print_status "Shutting down server..."
    exit 0
}

# Set trap to handle Ctrl+C gracefully
trap cleanup SIGINT SIGTERM

# Start the server
exec $SERVER_CMD
