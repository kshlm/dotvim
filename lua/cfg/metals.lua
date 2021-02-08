local metals = require 'metals'

metals_config = metals.bare_config
metals_config.init_options.statusBarProvider = 'on'

metals.initialize_or_attach(metals_config)
