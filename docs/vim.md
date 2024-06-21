# Setting Up `vim`

A very modern version of `vim` is installed by default on Ginsburg. You can run the following to load it:

```bash
module load vim/9.1
```

You could also add the line above to your `~/.bashrc` to make sure it's loaded every time.

You can experiment with installing `vim` or `nvim` yourself. It tends to be difficult and not as reliable but possible.

# Basic `vim` navigation

`vim` has many modes but the mode you're in when opening a file is Normal mode. To navigate in Normal mode you can use the following keys:

- `j` = move cursor down
- `k` = move cursor down
- `h` = move cursor left
- `l` = move cursor left
- `Ctrl+u` = move up one page
- `Ctrl+d` = move down one page
- `gg` = move to the top of the file
- `G` = move to the bottom of the file

To edit text you need to enter Insert mode. To enter Insert mode from Normal mode, simply type `i` and hit enter. You should see the mode change at the bottom of the screen. When in insert mode you should use the arrow keys to navigate and usual keys to type or delete (`Del` on MacOS and `Backspace` on Windows). To re-enter Normal mode, press `Esc`.

# Alternatives to `vim` (for using Ginsburg)

## Visual Studio Code

You can use Visual Studio Code with the `Remote - SSH` extension (Extension ID: ms-vscode-remote.remote-ssh). Visit [this website](https://code.visualstudio.com/) to install Visual Studio Code on your computer (i.e. not on Ginsburg). After you install it, you can go to the search bar at the top of the app and type ">Remote-SSH: Connect Current Window to Host". It'll prompt you to enter your login credentials (i.e. your UNI password).

## `nano`

A much simpler, but less capable text editor compared to `vim`. It's preinstalled on Ginsburg so you can just type `nano`. The instructions for how to use it are at the bottom of the terminal screen.

## `emacs`

An highly customizable, extensible text editor. It is as difficult or more difficult than `vim` but it can do far more than text editing. Learn more [here](https://www.gnu.org/software/emacs/). `emacs` is already installed on Ginsburg.
