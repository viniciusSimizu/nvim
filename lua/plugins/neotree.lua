return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    position = "current",
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}
