require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})
if os.getenv("NVIM") then
	require("hide-preview"):entry()
end
-- require("no-status"):setup()
