# fpkg

This name stands for **f**oreign **p**ac**k**a**g**e!

### "What is a 'foreign package'", you might ask:

That is how I call packages not available in the default distro repositories of
a user. It can be from any source but those, although the script currently
supports git and svn-based sources only.

### "And how's that work?"

`fpkg` needs 2 files in order to run: the text file `pkg.list` and the
directory `ii/` present on the directory it'll work on.

`pkg.list` contains a newline-separated list of all packages, and you currently
have to register them manually. You can easily do this by running `fpkg add`.

The list contains the packages to check for update and also a key to check if
that individual package needs to be updated with `--rebase` (in case it comes
from a git source) or not. A kinda crap way of implementing it, but hey, it
works! I might try improving it in the future.

The `ii` directory contains little scripts written manually (with a template
provided of course) for installing and uninstalling packages. Since not every
package uses the same steps for building, that was the solution I came up with.
`fpkg add` already redirects you to write those steps using your text editor of
choice, though!

### Requirements

You just need Bash and know how variables work in it, pretty much. It's just
for changing the script's program calls, nothing crazy.

Besides that, you'll also need the following (which most distros should
already ship preinstalled):

- awk
- coreutils (cat, echo, mkdir, stty)
- git (duh)
- grep
- sed
- svn (duhh)

### Basic Setup

1. Just put the script somewhere in your `$PATH`, I use `/usr/local/bin/` on mine for example.

2. As for the directory containing all packages, you just change `$FPKG_ROOT` to whatever directory you want, and if doesn't already exist, `fpkg` will make it for you!

3. And for the text editor, it's also as simple. Change `$EDITOR` to your preferred one.

4. Then, run `fpkg add` to register and write the .ii's for all the packages you have on your $FPKGDIR.

5. Then, you can run `fpkg update` just to check if everything is working and if your stuff is up to date of course.

6. That's it, you're good to go! And don't forget to run `fpkg help` to know some extra features too!

### Logging

This is used to track down the build process of a package, so that if something goes wrong, the user can just open the log file and find out.

On `fpkg`, logging works as follows:

- Two variables, `$FPKG_LOG` and `$LOG_FMT` are commented out. They respectively correspond to the location of the log file and the format of the timestamp on
the log file.
- Those variables are commented out by default, disabling the logging feature. To enable it, just uncomment them.

I'm not sure if I should keep it this way, it was the best I could think of.

### Contributing

Any suggestions or issues? Open a new issue or make a pull request, that would be very appreciated!

And actually, I would say that just by using this script you're already contributing to the project :)
