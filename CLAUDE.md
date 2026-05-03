# DigitalAutopilot Pages Repo

Public-facing GitHub Pages site at https://digitalautopilot.github.io

## Encryption rule

Before committing any file to this repo, ask: "Should this file be encrypted before publishing?"

- If yes: run `scripts/encrypt.sh <file>`, commit the `.enc` version to `public-encrypted/`, do not commit the plaintext
- If no: commit the file as-is

Never commit plaintext sensitive content (client data, credentials, internal docs) without asking first.

## Structure

- `public-encrypted/` — encrypted files safe for public access
- `scripts/encrypt.sh` — encrypt a single file
- `scripts/decrypt.sh` — decrypt a single file
- `.env` — holds `ENCRYPTION_SECRET` (never committed)
