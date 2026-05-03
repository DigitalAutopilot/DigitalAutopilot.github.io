#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
ENV_FILE="$REPO_ROOT/.env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "ERROR: .env not found at $ENV_FILE" >&2
  exit 1
fi

source "$ENV_FILE"

if [[ -z "${ENCRYPTION_SECRET:-}" ]]; then
  echo "ERROR: ENCRYPTION_SECRET not set in .env" >&2
  exit 1
fi

FILE="$1"
if [[ -z "$FILE" ]]; then
  echo "Usage: decrypt.sh <file.enc>" >&2
  exit 1
fi

DEST="${FILE%.enc}"
openssl enc -d -aes-256-cbc -pbkdf2 -k "$ENCRYPTION_SECRET" -in "$FILE" -out "$DEST"
echo "Decrypted: $FILE → $DEST"
