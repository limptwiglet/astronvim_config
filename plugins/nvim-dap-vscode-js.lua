local dap, dap_vscode = require "dap", require "dap-vscode-js"

dap_vscode.setup {
  debugger_cmd = { "js-debug-adapter" },
  adapters = { "pwa-node", "pwa-chrome" },
}
for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    language == "typescript" and {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "ts-node",
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
      resolveSourceMapLocations = {
        "${workspaceFolder}/dist/**/*.js",
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    } or {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      request = "attach",
      name = "Attach to chrome",
      port = 9222,
      url = "http://localhost:4200/*",
      webRoot = "${workspaceFolder}"
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end
