# Language environment
set -gx LANG en_US.UTF-8
set -Ux TLDR_LANGUAGE fr

# User binaries
fish_add_path $HOME/.local/bin

# .NET tools
if test -d /usr/share/dotnet
    fish_add_path /usr/share/dotnet
end
if test -d $HOME/.dotnet/tools
    fish_add_path $HOME/.dotnet/tools
end

# fnm (Node.js version manager) — --use-on-cd switch auto via .nvmrc
if test -d $HOME/.local/share/fnm
    fish_add_path $HOME/.local/share/fnm
    fnm env --use-on-cd --shell fish | source
end

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

# Podman socket for Docker-compatible tools (lazydocker, testcontainers, etc.)
if test -S /run/user/(id -u)/podman/podman.sock
    set -gx DOCKER_HOST "unix:///run/user/"(id -u)"/podman/podman.sock"
end

# Testcontainers: disable Ryuk (incompatible with Podman)
set -gx TESTCONTAINERS_RYUK_DISABLED true

# SSH — ProtonPass agent
set -gx SSH_AUTH_SOCK "$HOME/.ssh/proton-pass-agent.sock"

# Aliases
alias claude="$HOME/.claude/local/claude"
alias zed-update="curl -f https://zed.dev/install.sh | sh"

# Starship prompt
starship init fish | source

# opencode
fish_add_path $HOME/.opencode/bin
