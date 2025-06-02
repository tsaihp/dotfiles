# nvim

```bash
# install clangd
sudo apt install clangd git

# create folders
mkdir -p ~/.config/nvim/lua
mkdir -p ~/.local/share/nvim/lazy

# install Lazy.nvim
git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim
```

Generate compile_command.json

```bash
west build -b your_board path/to/module \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON # add this
```
