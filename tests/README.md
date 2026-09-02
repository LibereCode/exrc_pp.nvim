# tests

A bit scuffed in how to test this, but I did it like this:

1. Add the root of the repo to runtime (so I can `require("exrc_pp")`)
   - See `./.nvim.lua` for details.
   - Btw, `./.nvim.lua` just adds `../` to runtime (which in turn evaluates `../.nvim.lua`)
1. Simulate users `nvim/init.lua` in `./.nvim.lua`.
   - Which runs `require("exrc_pp").setup()`

So basically, [./.nvim.lua](./.nvim.lua) and [./.nvim](../.nvim)
are part of the tests.
