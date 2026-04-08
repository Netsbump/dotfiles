# Language environment
set -gx LANG en_US.UTF-8
set -Ux TLDR_LANGUAGE fr

# User binaries
fish_add_path $HOME/.local/bin

# .NET tools
fish_add_path /usr/share/dotnet
fish_add_path $HOME/.dotnet/tools

# npm global packages
fish_add_path $HOME/.npm-global/bin

# fnm (Node.js version manager)
if test -d $HOME/.local/share/fnm
    fish_add_path $HOME/.local/share/fnm
    fnm env --shell fish | source
end

# Aliases
alias claude="$HOME/.claude/local/claude"
alias hx="helix"
alias sshkey="cat ~/.ssh/id_ed25519.pub"
alias sshcopy="cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard"

# Starship prompt
starship init fish | source

# opencode
fish_add_path $HOME/.opencode/bin

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
