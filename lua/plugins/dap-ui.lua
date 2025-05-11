if true then
  return {}
end

return {
  "rcarriga/nvim-dap-ui",
  opts = {
    layouts = {
      {
        -- left panel
        elements = {
          { id = "scopes", size = 0.33 },
          { id = "breakpoints", size = 0.33 },
          { id = "stacks", size = 0.17 },
          { id = "watches", size = 0.17 },
        },
        size = 40, -- width
        position = "left",
      },
      {
        -- bottom panel
        elements = {
          { id = "repl", size = 0.5 },
          { id = "console", size = 0.5 },
        },
        size = 50, -- height
        position = "bottom",
      },
    },
  },
}
