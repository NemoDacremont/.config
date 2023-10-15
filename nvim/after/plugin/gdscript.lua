
local port = os.getenv('GDScript_Port') or '6005'

require("lspconfig").gdscript.setup { cmd = { "ncat", "localhost", "6005" } }

