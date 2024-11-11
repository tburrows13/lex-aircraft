local event_handler = require("event_handler")

event_handler.add_lib(require("script/aircrafts"))


remote.add_interface("lex-aircraft-cargo",
	{
		hauler_types = function()
			return { 'lex-flying-cargo', 'lex-flying-cargo-0' }
		end
	})
