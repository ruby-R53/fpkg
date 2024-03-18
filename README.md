# fpkg
This name stands for *f*oreign *p*ac*k*a*g*e!

### And what is a "foreign package"?

That is how I call packages not available on the repositories of an user. It can be from any source but those, although this script currently supports GitHub only.

### How does it work?

`fpkg` needs 2 files in order to run: the text file `pkg.list` and the directory `ii/`.

`pkg.list` contains a newline-separated list of all packages, and you currently have to register them manually. You can easily do this by running `fpkg add`.

This list is currently being used solely for `fpkg` to know which packages it has to update. The update happens by simply issuing `git pull` inside the selected directory :)

`ii/` contains little scripts written manually for installation of packages.

Since not every package uses the same steps for building, that was the solution I came up with. `fpkg add` already redirects you to write those steps using your favorite text editor, though!

### Setup

Just put the script somewhere in your `$PATH`. I use `/usr/local/bin/` for it.

As for the directory containing all packages, that is literally the first line of code (after the classic `#!/bin/bash` of course). You just change `$FPKGDIR` to whatever you want.

And for the text editor, it's also as simple. Change `$EDITOR` to your favorite text editor.

That's it, you're good to go! Don't forget to run `fpkg help` to get some extra stuff as well :)

### Contributing

Any suggestions or issues? Open a new issue or make a pull request, that would be very appreciated!

And I would say that just by using the script you're already contributing to this project honestly :)
