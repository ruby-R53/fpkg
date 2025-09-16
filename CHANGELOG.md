**September 16th, 2025:**
- `pkg.list` has been renamed to `pkg.lst`.
  - Just to make the extension naming scheme more consistent.
    Renaming that file shouldn't be a big issue anyway.
- Implementing modules as a way to extend fpkg's functionality,
  there was an attempt···
  - Yeah, turns out I'm not really ready to implement that. I
    guess it's better to leave things the way they were. It's
    not like there'll be that much demand for expansioning it
    anyway···

**September 15th, 2025:**
- That `call=$1; $call` line at the end of every `.ii` is no
  longer required.
  - Finally. I realized `source` exists, and I can use it to
    do the operations instead of that hacky way.
  - Now the code is cleaner, and I'd recommend to remove that
    line altogether.
  - This also means ii's don't require to be executable, so now
    the file mode provided by fpkg on every ii created is
    `-rw-r--r--`. This makes them a little safer, and now such
    files can't be run without fpkg's context.
  - However, it's now required to add another line of code at
    the very beginning of the file, if that first `if` block
    of it is uncommented. It's `stty echo`.
    - Because the thing makes the script exit before it can do
      anything, without this, keystrokes remain hidden. So
      add this to your ii's.

**September 4th, 2025:**
- You can now change less' behavior globally.
  - The default is to now quit if the whole file fits on the
    screen and the default tab width is set to 4 characters.
    This is done by changing `$LESS`, an environment variable
    less automatically detects to load user options. One more
    environment variable to our script setup now.
  - Should the pager actually be customizable too? I mean, most
    users would use less, but what about ones who would use
    something else for whatever reason?
    Meh, I'll just keep less for now.

**September 1st, 2025:**
- fpkg now doesn't abort when it fails to update one of the
  packages on a full-update session
  - The warning part of `msg()` ain't useless now :) I think
    this makes more sense as it's more convenient than aborting
    just because of one failed part.

**August 26, 2025:**
- You can now exclude packages from being updated with
  `fpkg u -x`
  - Inspired by emerge's `--exclude=` switch. I sometimes have
    to use it, so why not implement it here as well?
- You can now specify more than one package to still be updated
  alone with `fpkg u <pkg1> <pkg2>`
  - This comes in handy in case you only wanna update one
    package and its dependencies.
- Bundle with a Bash completion?
  - This would also come in handy, being able to have it
    autocomplete your package names would be nice. Still unsure
    about that tho', as I've never written a shell completion
    thing.

**August 25, 2025:**
- `switch` implemented for switching branches!
  - Why didn't I think of this before? I dunno. Maybe because
    I don't switch branches on my packages so often. But other
    people, especially other devs, might.
- `peek` now uses `less -F` instead of `cat`
  - Who knows if the user has wrote a bunch of stuff to their
    ii. This approach is a little bit slower, however.

**August 20, 2025:**
- `message` & `history` now support Subversion as well
  - I'm not satisfied with the former's results tho'··· I
    wanted its output to be on the same format as git's, but
    then I figured it'd be a pain to figure that out. I might
    come back at it later tho'.

**August 19, 2025 (AFTERNOON):**
- Initial support for Subversion implemented!
  - fpkg is now able to register svn-based packages and update
    them. As I'm still not very familiar with that VCS, I have
    a lot to figure out for it, like showing commit messages
    (if that's even a thing there as well).
    - This shit was a lot easier to implement than I thought,
      to be honest··· yet I procrastinated a lot for that to
      finally happen···
  - How about other VCSes?
    - Git and SVN are really the only ones that I know. I'm
      thinking of making this expandable by adding a plug-in
      support. It shouldn't be that difficult, but I don't feel
      like doing that now, especially considering I now have to
      learn about SVN's features.
  - Now that it supports two VCSes, should I make it require
    only one of them?
    - I mean, a user may only have packages that come from one
      VCS only, so it'll be pointless to require them to have
      another one installed on their system.
    - UPDATE: stupidity, there's no need for that. I just added
      a check to see if the user doesn't have any of the
      compatible VCSes instead.

**August 19, 2025 (MORNING):**
- fpkg now supports printing the commit messages of multiple
  packages at once
  - Finally, I've been so lazy to implement this, and here it
    is.
- Support for Subversion??
  - I still have to figure out how this works better. I only
    have one app that I installed from an svn-based source, so
    I'm still not very familiar with it.
  - I also have to figure out how to handle multiple version
    control programs here··· should I just add another field to
    `pkg.list`, just like how I did with `REBASE`?
- Add `-A` to ls' alias entry on .bashrc
  - Just for the sake of completeness. I also added
    `--color=auto`, tho' it didn't work on the terminal I
    tested it on.

**August 18, 2025:**
- Add colors and some other gay shit to the text output
  - Just a little detail I thought it'd be cool to add,
    'cos I figured it looked a little dull.
  - I also updated it to use tput instead of those ANSI
    escape codes, so that it'd maintain some compatibility
    across terminals.
- Should I add a `-[-q]uiet` switch for `install`?
  - Just like how Gentoo's emerge gives you the option to
    suppress text output and show a status text instead,
    I thought this would be nice to implement as well.
    It would be a considerable amount of work to do
    however, and I have to figure out how to handle that
    with packages that have `INTERACTIVE=ON`.
- `remove` now asks you if you want to delete a package's
  contents from your system as well
  - I actually had the idea of implementing that before, but
    didn't want to for some reason. I changed my mind now.
- Will the next version be 3.1.0 or 4.0.0??
  - I have some ideas in mind that might change this script by
    relatively a lot. Time will tell if there will be major
    changes or just a bunch of minor ones.
- Because I only now realized `tput` is part of ncurses, I also
  added some checks to see if the user has that installed.
- fpkg now aborts operation if either `$FPKG_ROOT` or `$EDITOR`
  are unset.
  - This is _super_ unlikely, but why not. Who knows what a
    user will do to your program.
- Near-late night update: if you ever feel useless, remember
  that I added a check for a thing that's literally depended by
  the very interpreter I'm writing this for.
  - Yes, only now I discovered that Bash actually depends on
    ncurses. I really had no idea about that. All that effort
    for nothing. Oh Well.
- `message`'s output now has prettier text output as well
  - Apparently you can set some fancy attributes with git's
    `--pretty` switch. That's pretty nice. (Not like I tried
    using `msg()` to try doing that and completely failed, no,
    that would be so stupid···)

**February 15, 2025:**
- Happy new year!
- The `Details:` field in `fpkg message` gets hidden if there's
  no message to show there.
- Fixed installing multiple packages with a single command.
  - Apparently it wasn't counting the amount of packages
    provided properly, and it also gave a "package name
	not provided" error if you entered only one.

**November 18, 2024:**
- You can now install multiple items in one command.
  - Just like in other package managers, you do it here by
    just running `fpkg i package1 package2 ...`!

**October 26, 2024:**
- Create `ii/` too if it doesn't already
  - I realized I create `$FPKG_ROOT` without making `ii/`
    too sometimes x) and that could be the case for some
    users too maybe
- Change terminal title when performing an installation
  - I actually forgot to put this in the changelog... I
    implemented it like at the beginning of this month...

**September 14, 2024:**
- Finally, FINALLY, VERSION 3.0.0 is OUT!!!
  - `FPKG_DIR` becomes `FPKG_ROOT`!
    - That naming makes more sense to me, other programs
      seem to use the same wording when referring to their
	  working directories...

**September 26, 2024:**
- The terminal title now changes when fpkg is building your
  program!

**September 14, 2024:**
- Finally, FINALLY, VERSION 3.0.0 is OUT!!!
  - `FPKG_DIR` becomes `FPKG_ROOT`!
    - That naming makes more sense to me, other programs
      seem to use the same wording when referring to their
	  working directories...

**September 12, 2024:**
- Version 3.0.0 is FINALly coming!!
  - New feature: fpkg rings the terminal bell when an
    installation process is finished successfully!
    - Got this idea from Gentoo's `emerge`, never
      thought I'd actually care about that terminal
	  feature lol
  - More code cleanup
    - I just learned that Bash can do one-line `if`'s
      just like in C, that is definitely useful!
  - I nuked my TODO list :'D
    - Everything I thought of doing was either finally
      done or just discarded. Now I ran out of ideas on
	  what to implement/change.

**September 10-11, 2024:**
- A little code cleanup, added some comments and
  reworded some stuff.

**July 28, 2024:**
- Fixed updating with rebase
  - I forgot to add a space when appending the rebase
    option to `git pull` :sob:
  - Plus forgot the `$` prefix for the rebase flag

**July 23, 2024:**
- More cleanup in the code
  - I barely test the `add` command :sob: so I
    fixed some formatting stuff.

**July 21, 2024:**
- Some cleanup on the code
  - Just placing some comments better and also
    formatting some stuff better. More consistent
	casing for variables and stuff.

**July 20, 2024:**
- Some more significant changes!!
  - Now `fpkg` doesn't pull with `rebase` every
    single time, instead it asks you if your
	package actually needs it.
	That also means you got to update your
	pkg.list this time! But it's not a big deal,
	you just append "REBASE=YES|NO" to every line
	:)
  - Fixed an error display I didn't even test
    beforehand
	- The "ERROR: <pkg> does not exist!" message.
	  It had a shitty formatting.
  - Better handling of interactive installations
    - Because the keystrokes are hidden when `fpkg`
      is invoked, interactive installation
	  processes get a bit weird. So now keystrokes
	  are visible when a package requires
	  interaction with the user.
  - `fpkg` won't register a package that's already
    registered.
	- It's just weird that I've only thought of this
	  now...
  - CHANGELOG becomes CHANGELOG.md!!
    - Not sure why GitHub doesn't apply the
	  markdown formatting when the file isn't saved
	  with the .md extension...
  - TODO becomes TODO.md!!
    - And speaking of that, I also removed all the
	  stuff that it had before and now I'm gonna
	  focus on more feasible goals.

**June 24-25, 2024:**
- For now, I've made rather visual upgrades:
  - Better format for `git log`
    - Man was that thing from previously ugly loll
	  Well, now `git log` actually has a *pretty*
	  output :)
  - Colored $PS1 for fpkg's shell

**May 29-30, 2024:**
- Version 3.0.0 is coming! For now, this is what I
  got for it:
  - Logging support implemented!
    - It's a rather sketchy one, but hey, it works
  - Better handling of `git log`
    - Only now I discovered about `--no-pager`.
	  I feel stupid right now. I could have done a
	  better research on that before.
  - You can now update individual packages instead
    of having to refresh all of them at once
  - You don't need those checks at the beginning of
    your ii's, I figured a better way of handling
	that
	- I should have thought of that before... oh
	  well, I learn something new every time I 
	  revisit my code
  - Commented the code a bit better
- Two items might get removed from the TODO list.
  I'm still a n00b, I shouldn't have thought of
  doing some of the stuff from there...

**May 17, 2024:**
- Version 2.1.1 is out!
  - Finally using that last number for something...
  - Just an improvement on the formatting at the 
    'add' section of the code
  - fpkg itself now already goes to the package's
    directory, the 'cd' on the .ii's is now not
	required! Change your .ii's accordingly!
- Still have to figure out how to do the stuff I
  put on the TODO list...

**April 28, 2024:**
- Version 2.1.0 is out!
- The package manager is stupid, and that's because I am
  stupid.
  - Fixed the 'add' command: it checks the argument
    better now, and can add the package properly.
	See the diff :)
  - Added command 'remove': now fpkg is able to uninstall
  	packages too! Update your .ii's accordingly now!
- Improved 'goto'
  - fpkg will now use a new .bashrc for its shell. Add
    the new .bashrc to $FPKGDIR!
- Added a TODO file
  - So that I can write down stuff I could implement one
    day

**March 25 - April 8, 2024:**
- Version 2.0.0 is out already!
- Improved error handling some more
- Changed 'add' and 'delete' actions to take the package
  name as an argument
- Added 'edit':
  - You can now edit a package's .ii using your editor
    (defined in $EDITOR)
  - Should I make it able to edit the package name and
    directory as well?
- Added some functions in the code so that it doesn't get
  redundant
- Fixed a silly typo
  - Figure out what it was and get a cake :)
- Added 'peek': you can now just look at a package's .ii
- Added 'goto': you can now change to a package's
  directory for a moment instead of typing its whole path
- fpkg can now update git repos with submodules properly!
  - Not sure if my implementation of it is crap though...
- Changed how 'install' works
  - The first line of the .ii's now start with
    'cd <pkg>/' instead of 'cd ../<pkg>/', change your
	.ii's accordingly!

**March 19, 2024:**
- Added a versioning scheme, first release
  - major.minor.revision -> 1.0.0
  - major: +1 when the entire program is changed
  - minor: +1 when fixing something or adding a feature
  - revision: +1 for anything else that doesn't affect
    the program that much
- Commented the code a bit better
- Updated 'help'
- Removed a redundancy on the code, see diff for 'delete'
- Created this changelog thing
