# fpkg

This name stands for **f**oreign **p**ac**k**a**g**e!

### "What is a 'foreign package'", you might ask:

That is how I call packages not available in the default distro repositories of a user.
It can be from any source but those, although the script currently supports git and
svn-based ones only.

### "And how's that work?"

`fpkg` needs 4 files in order to run: the text file `pkg.list`, the directory
`ii/` present on the directory it'll work on, `/etc/fpkg/` and related.

`pkg.list` contains a newline-separated list of all packages, and you currently have to
register them manually. You can easily do this by running `fpkg add`.

The list contains the packages to check for updates and also a key to check if that
individual package needs to be updated with `--rebase` (in case it comes from a git
source) or not. A kinda crap way of implementing it, but hey, it works! I might try
improving it in the future.

The `ii` directory contains little scripts written manually (with a template provided of
course) for installing and uninstalling packages. Since not every package uses the same
steps for building, that was the solution I came up with. `fpkg add` already redirects
you to write those steps using your text editor of choice, though!

Then, as for the files in `/etc/fpkg/`···
- `/etc/fpkg/fpkg.conf`: the configuration file containing all information needed for
  fpkg to work according to your environment. See more below.
- `/etc/fpkg/bashrc`: the resource file for the Bash shell used by fpkg to work on your
  packages' directories. It's not a whole separate environment, but it's different
  enough to recognize it.
- `/etc/fpkg/modules/`: module files. Those tell fpkg how to perform updates, get commit
  messages and such. You *must* have it, otherwise nothing will even work at all.

### Requirements

You just need Bash and know how variables work in it, pretty much. It's just for changing
the script's program calls, nothing crazy.

Besides that, you'll also need the following (which most distros should already ship
preinstalled):

- coreutils (cat, cut, echo, mkdir, stty)
- grep
- less
- sed
- make
- at least one of: git and svn (duh)

### Setup

1. Simply install the program by running `make`. By default, this will install the script
itself to `/usr/local/bin/`, along with the configuration file `fpkg.conf` and the bundled
`bashrc` file to `/etc/fpkg/`.
The modules are also installed to a subdirectory of that, `modules/`.
The completion script, `fpkg.bashcomplete`, is then installed to
`/usr/share/bash-completion/completions/`.

You may then change `$PREFIX` to whatever directory you'd like the script to be installed
on.

2. Edit the configuration file `/etc/fpkg.conf` according to your setup. It currently has
the following parameters:
- `FPKG_ROOT`: the core, the directory where all your foreign packages are located, for
  fpkg to handle them.
- `EDITOR`: set this to your preferred text editor. This is used to add and edit your
  .ii's.
- `LESS`: this is used by the pager program, `less`, to set how it behaves. By default,
  you get:
  - quit if the file fits in a single screen (`-F`);
  - process ANSI escape codes for colorized output (`-R`);
  - and tab width set to 4 characters (`-x4`).

3. Then, run `fpkg add` to register and write the .ii's for all the packages you have on
`$FPKG_ROOT`.

4. Then, you may run `fpkg update` just to check if everything is working and if your
stuff is up to date of course.

5. And that's it, you're set! Don't forget to run `fpkg help` to see some extra features
as well!

### Logging

This is used to track down the build process of a package, so that if something goes
wrong, the user can just open the log file and find out.

On `fpkg`, logging works as follows:

- Two variables, `$FPKG_LOG` and `$LOG_FMT`, are commented out. They respectively
correspond to the location of the log file and the format of the timestamp on the log
file.
- Those variables are commented out by default, disabling the logging feature. To enable
it, just uncomment them and make sure they're set (duh).

I'm not sure if I should keep it this way, it was the best I could think of.

### Contributing

Any suggestions or issues? Open a new issue or make a pull request, that would be very
appreciated!

And actually, I would say that just by using this script you're already contributing to
the project :)
