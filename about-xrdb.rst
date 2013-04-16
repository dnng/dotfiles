xrdb smallest tutorial on this planet
-------------------------------------

If you ever get yourself needing to configure your uxterm to be more user
friendly, you can use xrdb to set the default properties of your X server.

You could also read the man page of xrdb to figure out how to set it (this
document is just a reminder for myself, since I'm the only one using it, and I'm
on a disposable Ubuntu installation, so I can mess around with this. There's
probably a better way to configure your uxterm than this, but I still have to
learn a bit more about it).

This is the way I do things! **Use it at your own risk!!!**
Remember that this will erase your previous configuration and load a new one
from the file you specified! I encourage you to read the man page before doing
it!

# Edit your .Xresources configuration file with the defaults for uxterm
user@machine ~ $ vim .Xresources 

# Save it as the new default configuration
user@machine ~ $ xrdb -load ~/.Xresources

# Run uxterm and test it (I did this from a gnome-terminal)
user@machine ~ $ uxterm &
