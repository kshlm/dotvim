local navigator = require("navigator")

navigator.setup({
	icons = {
		code_action_icon = "",
		code_lens_action_icon = "",
		diagnostic_err = "",
		diagnostic_warn = "",
		diagnostic_info = "",
		diagnostic_hint = "",
		diagnostic_virtual_text = " ",
		diagnostic_head_severity_1 = "",
    diagnostic_head_severity_2 = "",
    diagnostic_head_severity_3 = "",
    diagnostic_head_description = " ",
		diagnostic_head = "",
		diagnostic_file = "",

		match_kinds = {
			var = "",
			method = "",
			["function"] = "",
			parameter = "",
			associated = "",
			namespace = "",
			type = "ﴯ",
			field = "ﰠ",
		},
	},
	lsp = {
		code_action = { virtual_text = false },
		code_lens_action = { virtual_text = false },
	},
	lsp_installer = true,
})
