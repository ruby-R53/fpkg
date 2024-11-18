November 18, 2024:
- You can now install multiple items in one command.
  - Just like in other package managers, you do it here by
    just running `fpkg i package1 package2 ...`!

October 26, 2024:
- Create `ii/` too if it doesn't already
  - I realized I create `$FPKG_ROOT` without making `ii/`
    too sometimes x) and that could be the case for some
    users too maybe
- Change terminal title when performing an installation
  - I actually forgot to put this in the changelog... I
    implemented it like at the beginning of this month...

September 14, 2024:
- Finally, FINALLY, VERSION 3.0.0 is OUT!!!
  - `FPKG_DIR` becomes `FPKG_ROOT`!
    - That naming makes more sense to me, other programs
      seem to use the same wording when referring to their
	  working directories...

September 26, 2024:
- The terminal title now changes when fpkg is building your
  program!

September 14, 2024:
- Finally, FINALLY, VERSION 3.0.0 is OUT!!!
  - `FPKG_DIR` becomes `FPKG_ROOT`!
    - That naming makes more sense to me, other programs
      seem to use the same wording when referring to their
	  working directories...

September 12, 2024:
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

September 10-11, 2024:
- A little code cleanup, added some comments and
  reworded some stuff.

July 28, 2024:
- Fixed updating with rebase
  - I forgot to add a space when appending the rebase
    option to `git pull` :sob:
  - Plus forgot the `$` prefix for the rebase flag

July 23, 2024:
- More cleanup in the code
  - I barely test the `add` command :sob: so I
    fixed some formatting stuff.

July 21, 2024:
- Some cleanup on the code
  - Just placing some comments better and also
    formatting some stuff better. More consistent
	casing for variables and stuff.

July 20, 2024:
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

June 24-25, 2024:
- For now, I've made rather visual upgrades:
  - Better format for `git log`
    - Man was that thing from previously ugly loll
	  Well, now `git log` actually has a *pretty*
	  output :)
  - Colored $PS1 for fpkg's shell

May 29-30, 2024:
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

May 17, 2024:
- Version 2.1.1 is out!
  - Finally using that last number for something...
  - Just an improvement on the formatting at the 
    'add' section of the code
  - fpkg itself now already goes to the package's
    directory, the 'cd' on the .ii's is now not
	required! Change your .ii's accordingly!
- Still have to figure out how to do the stuff I
  put on the TODO list...

April 28, 2024:
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

March 25 - April 8, 2024:
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

March 19, 2024:
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
