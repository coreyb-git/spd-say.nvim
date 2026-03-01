# spd-say.nvim
Listen as you type in NeoVim.

For when your eyes are too tired to focus, or your NeoVim config is so ugly you can't stand to look at it anymore.

Repeats the prior word after pressing the spacebar in insert mode only.

```lua
return {
  "coreyb-git/spd-say.nvim",
  opts = {},
}
```

Toggle on/off with the command:

```lua
:SpdSayToggle

```

To speak something specific you can try:

```lua
:lua require("spd-say").say("Domo arigato, Mr Robot-o")
```

And for silence:

```lua
:lua require("spd-say").stop()
```
