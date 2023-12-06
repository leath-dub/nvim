return {
  rust_analyzer = function ()
    require("rust-tools").setup {}
  end,
  ansible_ls = function ()
    require("lspconfig").ansiblels.setup {
      filetypes = {
        "yaml.ansible",
      },
      settings = {
        ansible = {
          ansible = {
            path = "ansible",
            useFullyQualifiedCollectionNames = true
          },
          ansibleLint = {
            enabled = true,
            path = "ansible-lint"
          },
          executionEnvironment = {
            enabled = false
          },
          python = {
            interpreterPath = "python"
          },
          completion = {
            provideRedirectModules = true,
            provideModuleOptionAliases = true
          }
        },
      },
    }
  end,
}
