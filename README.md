This program was written in early July 2015 because of a challenge/request from Pam.
====================

It takes two command-line arguments:
 * a path to a folder
 * a path to an icon

The folder provided serves as the root of the infection.

PamVirus recursively traverses the given folder, finds all folders, renames them to "I_Love_Pami" with a number of dots at the end so that no name collisions occur, and sets their icon to the second given argument.
The icon is intended to be a purple heart.

PamVirus works on Ubuntu Linux and should work on all GNOME-based environments.

Finally, here is how you run it:
ruby pamvirus.rb /path/to/folder/to/infect /path/to/icon

