return {
  {
    'ThePrimeagen/harpoon',
    --stylua: ignore
    keys = {
      { "<leader>a",  function() require("harpoon.mark").add_file() end,
        desc = "Add File" },
      { "<leader>h",  function() require("harpoon.ui").toggle_quick_menu() end,
        desc = "File Menu" },
      { "<leader>cm", function() require("harpoon.cmd-ui").toggle_quick_menu() end,
        desc = "Command Menu" },
      { "<leader>1",  function() require("harpoon.ui").nav_file(1) end,
        desc = "File 1" },
      { "<leader>2",  function() require("harpoon.ui").nav_file(2) end,
        desc = "File 2" },
      { "<leader>3",  function() require("harpoon.term").gotoTerminal(1) end,
        desc = "File 3" },
      --      { "<leader>t1",  function() require("harpoon.term").gotoTerminal(1) end,       
       -- desc = "Terminal 1" },

    },
    opts = {
      global_settings = {
        save_on_toggle = true,
        enter_on_sendcmd = true,
      },
    },
  },
}
