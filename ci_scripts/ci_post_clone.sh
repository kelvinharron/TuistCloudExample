#!/bin/sh
curl https://mise.jdx.dev/install.sh | sh
export PATH="$HOME/.local/bin/$PATH" # Installs the tools in .mise.toml in the project root
~/.local/bin/mise install # Installs the version from .mise.toml
eval "$(mise activate bash --shims)"
cd ..

~/.local/bin/mise x -- tuist install
~/.local/bin/mise x -- tuist cache
~/.local/bin/mise x -- tuist generate --no-open
