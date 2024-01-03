return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-plenary",
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
    "thenbe/neotest-playwright",
  },
  opts = function(_, opts)
    table.insert(opts.adapters, require("neotest-jest")({}))
    table.insert(opts.adapters, require("neotest-vitest"))
    table.insert(
      opts.adapters,
      require("neotest-playwright").adapter({
        persist_project_selection = true,
        enable_dynamic_test_discovery = true,
      })
    )
  end,
}
