if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = { "bash", "-c", "iconv -f UTF-8 -t UTF-16 | clip.exe" },
      ["*"] = { "bash", "-c", "iconv -f UTF-8 -t UTF-16 | clip.exe" },
    },
    paste = {
      ["+"] = {
        "bash",
        "-c",
        "powershell.exe -NoLogo -NoProfile -Command 'Get-Clipboard -Raw' | iconv -f UTF-16 -t UTF-8",
      },
      ["*"] = {
        "bash",
        "-c",
        "powershell.exe -NoLogo -NoProfile -Command 'Get-Clipboard -Raw' | iconv -f UTF-16 -t UTF-8",
      },
    },
    cache_enabled = 0,
  }
elseif vim.fn.has("tmux") == 1 then
  -- Tmux: Sử dụng tmux clipboard hoặc OSC 52
  vim.g.clipboard = {
    name = "TmuxClipboard",
    copy = {
      ["+"] = { "tmux", "load-buffer", "-" },
      ["*"] = { "tmux", "load-buffer", "-" },
    },
    paste = {
      ["+"] = { "tmux", "save-buffer", "-" },
      ["*"] = { "tmux", "save-buffer", "-" },
    },
    cache_enabled = 1,
  }
else
  -- Linux/macOS: Sử dụng xclip hoặc pbcopy
  vim.g.clipboard = {
    name = "SystemClipboard",
    copy = {
      ["+"] = vim.fn.has("mac") == 1 and "pbcopy" or "xclip -selection clipboard",
      ["*"] = vim.fn.has("mac") == 1 and "pbcopy" or "xclip -selection clipboard",
    },
    paste = {
      ["+"] = vim.fn.has("mac") == 1 and "pbpaste" or "xclip -selection clipboard -o",
      ["*"] = vim.fn.has("mac") == 1 and "pbpaste" or "xclip -selection clipboard -o",
    },
    cache_enabled = 0,
  }
end



-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
