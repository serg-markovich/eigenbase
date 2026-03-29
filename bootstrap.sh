#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/serg-markovich/eigenbase.git"
TARGET_DIR="${HOME}/eigenbase"
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

echo -e "${GREEN}⚡ eigenbase bootstrap starting...${NC}"

if ! command -v ansible &>/dev/null; then
  echo -e "${YELLOW}Installing Ansible...${NC}"
  sudo apt-get update -qq
  sudo apt-get install -y ansible git python3-pip
fi

if [ ! -d "$TARGET_DIR" ]; then
  git clone "$REPO_URL" "$TARGET_DIR"
fi
cd "$TARGET_DIR"

if [ ! -f .env ]; then
  cp .env.example .env
  echo -e "${YELLOW}⚠ .env created. Fill in your values and re-run: make all${NC}"
  echo "  nano .env"
  exit 0
fi

source .env
make all
