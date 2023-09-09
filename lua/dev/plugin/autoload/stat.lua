local function get_buffers()
  local opts = {}
  -- Thanks to telescope source !
  local bufnrs = vim.tbl_filter(function(b)
    if 1 ~= vim.fn.buflisted(b) then
      return false
    end
    -- only hide unloaded buffers if opts.show_all_buffers is false, keep them listed if true or nil
    if opts.show_all_buffers == false and not vim.api.nvim_buf_is_loaded(b) then return false
    end
    if opts.ignore_current_buffer and b == vim.api.nvim_get_current_buf() then
      return false
    end
    if opts.cwd_only and not string.find(vim.api.nvim_buf_get_name(b), vim.loop.cwd(), 1, true) then
      return false
    end
    if not opts.cwd_only and opts.cwd and not string.find(vim.api.nvim_buf_get_name(b), opts.cwd, 1, true) then
      return false
    end
    return true
  end, vim.api.nvim_list_bufs())
  local buffers = {}
  for _, bufnr in ipairs(bufnrs) do
    local element = {
      bufnr = bufnr,
      info = vim.fn.getbufinfo(bufnr)[1],
    }
    table.insert(buffers, element)
  end
  return buffers
end

local function buffer_line(stat)
  local utils = require("telescope.utils")
  local lib = stat.lib

  return function ()
    local res = ""
    local cwd = vim.fn.expand(vim.loop.cwd())
    local Path = require("plenary.path")
    for _, b in ipairs(get_buffers()) do
      local icon, hl_group = utils.get_devicons(b.info.name, false)
      local icon_width = vim.fn.strdisplaywidth(icon) + 1
      icon = icon .. (" "):rep(icon_width)

      local bufname = b.info.name ~= "" and b.info.name or "[No Name]"
      bufname = Path:new(bufname):normalize(cwd)

      if b.info.bufnr == vim.api.nvim_get_current_buf() then
        res = res .. lib.set_hl_abs(hl_group) .. lib.add_margin(icon .. lib.unset_hl() .. bufname, 1) .. lib.set_hl_abs("TabLineFill")
      else
        local bfr_line_hl = lib.get_hl_val_abs("TabLineFill")
        local new_hl = lib.set_hl_val_abs({ fg = lib.get_hl_val_abs(hl_group).fg, bg = bfr_line_hl.bg })
        res = res .. lib.set_hl_abs(new_hl) .. lib.add_margin(icon .. lib.set_hl_abs("TabLineFill") .. bufname, 1)
      end
    end
    return res
  end
end

local function load_lualine_theme(theme_name)
  local path = table.concat { 'lua/lualine/themes/', theme_name, '.lua' }
  local files = vim.api.nvim_get_runtime_file(path, true)
  if #files <= 0 then
    path = table.concat { 'lua/lualine/themes/', theme_name, '/init.lua' }
    files = vim.api.nvim_get_runtime_file(path, true)
  end
  local retval = {}
  local n_files = #files
  if n_files == 0 then
    -- No match found
    error(path .. ' Not found')
  elseif n_files == 1 then
    -- when only one is found run that and return it's return value
    retval = dofile(files[1])
  else
    -- put entries from user config path in front
    local user_config_path = vim.fn.stdpath('config')
    table.sort(files, function(a, b)
      return vim.startswith(a, user_config_path) or not vim.startswith(b, user_config_path)
    end)
    -- More then 1 found . Use the first one that isn't in lualines repo
    local sep = package.config:sub(1, 1)
    local lualine_repo_pattern = table.concat({ 'lualine.nvim', 'lua', 'lualine' }, sep)
    local file_found = false
    for _, file in ipairs(files) do
      if not file:find(lualine_repo_pattern) then
        retval = dofile(file)
        file_found = true
        break
      end
    end
    if not file_found then
      -- This shouldn't happen but somehow we have multiple files but they
      -- appear to be in lualines repo . Just run the first one
      retval = dofile(files[1])
    end
  end
  return retval
end

return {
  "leath-dub/stat.nvim",
  event = "Colorscheme",
  config = function()
    local ok, stat = pcall(require, "stat")
    if not ok then
      return {}
    end

    local ___ = Stat.___
    stat.setup {
      winbar = {
        buffer_line(stat),
      },
      statusline = {
        ___,
        Stat.mod.mode,
        Stat.mod.filetype,
        Stat.mod.git_diff
      },
      theme = stat.lib.lualine('decay'),
    }
  end
}
