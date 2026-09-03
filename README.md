# exrc++

A better `exrc` for nvim: **exrc++.nvim**

## ABOUT

The option `vim.opt.exrc`, when true, will scan $PWD/.nvim.lua,
and if found test if the file is trusted.
If it is trusted it will load it, otherwise it will prompt user to trust the file.

### PROBLEMS

- Only scan current directory, so it doesn't care what the project directory is.
- It is just a file.

### SOLUTION

Instead I will instead use a function that recursively scans
parent-directories if the **directory** `./.nvim` is found,
and if so add that _mf_ to `vim.opt.runtimepath`.

- Will also utilize the `vim.secure.trust` command (works like how `exrc` does).
- Will scan and (try) load for each parent-directory until
  the (user-configurable, defaults to `{ ".git" }`) `root` is found.

## INSTALLATION

### vim.pack

```lua nvim/init.lua or something idk
vim.pack.add({
    "https://github.com/LibereCode/exrc_pp.nvim",
})
require("exrc_pp").setup({
    -- opts go here
})
```

### lazy

## LICENSE

<p>
    Copyleft (🄯) 2026 LibereCode. All Rights Reserved.<br>
    Licensed under the <b>EUPL-1.2</b>.<br>
    See [the LICENSE](./LICENSE) for details.<br>
</p>
