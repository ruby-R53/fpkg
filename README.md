# fpkg
`fpkg` stands for "`f`oreign `p`ac`k`a`g`e".

## what are foreign packages, though?

this is how i call packages that are not available in the repositories the user currently has, meaning they take them from other sources

## how's that work?

you have 2 files: `pkg.list` and `pkg.ii` files. both of them are on the default fpkg directory, `/usr/local/fpkg/`

pkg.list contains the list of packages the user registered.

"ii" stands for "`i`nstallation `i`nstructions", and files containing that extension are used by fpkg for installing packages.

since there's no standard way of installing packages, that was the solution i came up with lol

.ii files are made during the package registration process, the user has to type everything necessary for that package to install, like `./configure; make; make install`

the script is written entirely in bash. i originally wanted to make it in c, but nah
