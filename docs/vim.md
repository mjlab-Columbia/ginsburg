# Setting Up `vim`

A very modern version of `vim` is installed by default on Ginsburg. You can run the following command to load it:

```bash
module load vim/9.1
```

You can also add the line above to your `~/.bashrc` to make sure `vim` is loaded every time you log into Ginsburg.

You can experiment with installing `vim` or `nvim` yourself. It tends to be difficult and not as reliable as the default `vim`, but it can offer more features.

# Basic `vim` navigation

`vim` has many modes but we'll just focus on 2 for this document: Normal and Insert. The mode you're in when opening a file is Normal mode. To navigate in Normal mode you can use the following keys:

- `j` = move cursor down
- `k` = move cursor down
- `h` = move cursor left
- `l` = move cursor right
- `Ctrl+u` = move up one page
- `Ctrl+d` = move down one page
- `gg` = move to the top of the file
- `G` = move to the bottom of the file

To edit text you need to enter Insert mode. To enter Insert mode from Normal mode, simply type `i` and hit enter. You should see the mode change at the bottom of the screen. When in insert mode you should use the arrow keys to navigate and usual keys to type or delete characters (deleting is `Del` on MacOS and `Backspace` on Windows, just like normal). To re-enter Normal mode, press `Esc`.

# Alternatives to `vim` (for using Ginsburg)

## Visual Studio Code

You can use Visual Studio Code with the `Remote - SSH` extension (Extension ID: ms-vscode-remote.remote-ssh). Visit [this website](https://code.visualstudio.com/) to install Visual Studio Code on your computer (i.e. not on Ginsburg). After you install it, you can go to the search bar at the top of the app and type ">Remote-SSH: Connect Current Window to Host". It'll prompt you to enter your login credentials (i.e. your UNI password).

## `nano`

A much simpler, but less capable text editor compared to `vim`. It's pre-installed on Ginsburg so you can just type `nano` and hit enter. The instructions for how to use it are at the bottom of the terminal screen.

## `emacs`

A highly customizable, extensible text editor. It is as difficult or more difficult than `vim` but it can do far more than text editing. Learn more [here](https://www.gnu.org/software/emacs/). `emacs` is already installed on Ginsburg.
