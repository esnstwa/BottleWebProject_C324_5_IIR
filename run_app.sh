#!/bin/zsh
set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
PYTHON="$PROJECT_DIR/.venv/bin/python"
APP="$PROJECT_DIR/BottleWebProject_C324_5_IIR/app.py"

if [ ! -x "$PYTHON" ]; then
  python3 -m venv "$PROJECT_DIR/.venv"
fi

"$PYTHON" -m pip install -r "$PROJECT_DIR/BottleWebProject_C324_5_IIR/requirements.txt"
cd "$PROJECT_DIR/BottleWebProject_C324_5_IIR"
"$PYTHON" "$APP"
