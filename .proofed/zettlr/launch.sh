#!/bin/bash
# Opens Zettlr on a fresh profile with paragraph marks on and one note whose
# paragraphs are separated by a blank line. The version in config.json skips onboarding.
set -euo pipefail
profile=$(mktemp -d)
note="$profile/paragraphs.md"
printf 'Alpha\n\nOmega\n' > "$note"
version=$(node -p 'require("./package.json").version')
cat > "$profile/config.json" <<JSON
{"version":"$version","openPaths":["$note"],"system":{"checkForUpdates":false},"editor":{"showWhitespace":true}}
JSON
cat > "$profile/documents.yaml" <<YAML
f90e5fc5-10aa-4795-adf4-8bd38f6dc2d8:
  type: leaf
  id: c5946d30-fb11-4aca-a9da-4e07491ce5f0
  openFiles:
    - path: $note
      pinned: false
  activeFile:
    path: $note
    pinned: false
YAML
export NODE_ENV=production
exec "${ZETTLR_ELECTRON:-node_modules/electron/dist/Electron.app/Contents/MacOS/Electron}" . \
  --data-dir="$profile" --user-data-dir="$profile" --remote-debugging-port=9314
