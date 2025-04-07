-- 
-- globals.lua
--  

local g = vim.g

-- Disable explorer
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Diagnostics -- 

local d = vim.diagnostic

-- Enable virtual text 
d.config({ virtual_text = true})
