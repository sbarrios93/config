local wezterm = require("wezterm")
local COLOR_SCHEME = "Catppuccin Mocha"

local format_title = function(title, is_active, max_width)
	local title_len = #title
	local pad_len = math.floor((max_width - title_len) / 2)

	local formatted_title = {
		Text = string.rep(" ", pad_len) .. title .. string.rep(" ", pad_len),
	}

	return { formatted_title }
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.active_pane.title

	-- Ensure there's a valid title, defaulting to 'No Title' if none is found
	if type(title) ~= "string" or #title == 0 then
		title = "No Title"
	end

	return format_title(title, tab.is_active, max_width)
end)
wezterm.on("user-var-changed", function(window, pane, name, value)
	wezterm.log_info("user-var-changed", name, value)
	if name == user_var_tab_title_key then
		pane:tab():set_title(value)
	end
end)

return {
	font = wezterm.font("JetBrainsMono Nerd Font Mono"),
	font_size = 13,
	tab_max_width = 14,
	color_scheme = COLOR_SCHEME,
	colors = {
		tab_bar = {
			background = "#1e1e2e",
			new_tab = {
				bg_color = "#1e1e2e",
				fg_color = "#f5e0dc",
			},
			inactive_tab = {

				bg_color = "#1e1e2e",
				fg_color = "#cdd6f4",
			},
			active_tab = {
				fg_color = "#1e1e2e",
				bg_color = "#f5e0dc",
			},
		},
	},
	window_decorations = "RESIZE",
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
}
