local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities
return {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
}
