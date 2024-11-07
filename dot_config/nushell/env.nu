$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
    to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
    to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
# The default for this is $nu.default-config-dir/scripts
$env.NU_LIB_DIRS = [
  ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
  ($nu.data-dir | path join 'completions') # default home for nushell completions
]

# Directories to search for plugin binaries when calling register
# The default for this is $nu.default-config-dir/plugins
$env.NU_PLUGIN_DIRS = [
  ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

$env.VIRTUAL_ENV_DISABLE_PROMPT = true
# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
# An alternate way to add entries to $env.PATH is to use the custom command `path add`
# which is built into the nushell stdlib:
# use std "path add"
# $env.PATH = ($env.PATH | split row (char esep))
# path add /some/path
# path add ($env.CARGO_HOME | path join "bin")
# path add ($env.HOME | path join ".local" "bin")
# $env.PATH = ($env.PATH | uniq)
const tool_dir = $nu.default-config-dir| path join tools 
if (not ($tool_dir | path exists)) {mkdir $tool_dir} 

def cmd-exists --env [cmd: string] {
  (which $cmd | length) > 0
}

if (cmd-exists "carapace") {
  $env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
  carapace _carapace nushell | save --force ($tool_dir|path join carapace.nu)
}

if (cmd-exists "zoxide") {
  zoxide init nushell | save -f ($tool_dir|path join zoxide.nu)
}

if (cmd-exists "oh-my-posh") {
  oh-my-posh init nu --config ($env.XDG_CONFIG_HOME | path join omp tokoyonight.json) --print | save -f ($tool_dir|path join omp.nu)
}

