-- In your LazyVim plugin config
return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      max_name_length = 999, -- or a high enough value to avoid truncation
      truncate_names = false, -- avoid cutting off long names
      tab_size = 0, -- optional: 0 makes tab size dynamic
    },
  },
}
