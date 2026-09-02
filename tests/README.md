# tests

A bit scuffed in how to test this, but I did it like this:

1. Add the root of the repo to runtime (so I can `require("exrc_pp")`)
   - See `./.nvim.lua` for details.
   - Btw, `./.nvim.lua` is a symlink from `../.nvim.lua`
1. Simulate users `nvim/init.lua` with the file {_root_ `../.nvim/plugin/init.lua`
   - (which will automatically be evaluated now that `../nvim` is in _runtimepath_)

So basically, [./.nvim.lua](./.nvim.lua) and [plugin/init.lua](../.nvim/plugin/init.lua)
are part of the tests.
