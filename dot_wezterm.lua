local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
math.randomseed(os.time()) -- seed the random number generator

local night_schemes = {
	"Dracula (Official)",
	"Catppuccin Frappé (Gogh)",
	"Catppuccin Frappe",
	"Catppuccin Macchiato",
	"Catppuccin Macchiato (Gogh)",
	"Catppuccin Mocha",
	"Catppuccin Mocha (Gogh)",
	"Tokyo Night",
	"Tokyo Night (Gogh)",
	"Tokyo Night Moon",
	"Tokyo Night Storm",
	"Tokyo Night Storm (Gogh)",
}

config.color_scheme = night_schemes[math.random(1, #night_schemes)]
config.font = wezterm.font("FiraCode Nerd Font", { weight = "Bold" })
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "VictorMono NF",
			weight = "Bold",
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({
			family = "VictorMono NF",
			weight = "Bold",
			style = "Italic",
		}),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({
			family = "VictorMono NF",
			style = "Italic",
		}),
	},
}
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }
config.font_size = 15
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}
config.default_prog = { "pwsh", "--nologo" }
config.default_cwd = "~"
config.use_ime = true
config.window_close_confirmation = "NeverPrompt"
-- config.window_decorations = "NONE"

local act = wezterm.action
config.keys = {
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = act.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "Enter",
		mods = "ALT",
		action = act.Nop,
	},
	{
		key = "Enter",
		mods = "CTRL|SHIFT",
		action = act.SplitPane({
			direction = "Right",
		}),
	},
	{
		key = "F11",
		action = act.ToggleFullScreen,
	},
	{
		key = "Enter",
		mods = "ALT|SHIFT",
		action = act.SplitPane({
			direction = "Down",
		}),
	},
	{
		key = "h",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "!",
		mods = "ALT|SHIFT",
		action = act.SpawnCommandInNewTab({
			args = { "wsl", "~" },
		}),
	},
	{
		key = "@",
		mods = "ALT|SHIFT",
		action = act.SpawnCommandInNewTab({
			args = { "pwsh" },
		}),
	},
}
config.mouse_bindings = {
	-- Bind 'Up' event of CTRL-Click to open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL|SHIFT",
		action = act.OpenLinkAtMouseCursor,
	},
	-- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "CTRL|SHIFT",
		action = act.Nop,
	},
}
return config
