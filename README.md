# FlashSocketMITM
Hooking flash.net.Socket in Flash and then gaining full MITM through JavaScript.


Let me give you some answers to your probable questions.

# Why? 

Flash might be dying but SWF's will remain on web. This is a bit grave digging, but it is fun to recover stuff.

# Why this?

Sometimes best way to understand something is to view it, modify it, add or remove something from it. There wasn't a tool for this so I decided to make one.

# Why extending Socket?

Because we need to hook the points of interest. We don't want to recreate all properties and methods, so they will be just inherited. Easier this way.

# What to add more?

JavaScript control, I'd say. Exposing MITM controls to JavaScript and from there doing "create, edit, delete" modifications. Viewing, saving and stuff. Updating JavaScript is much easier.


# But wouldn't this class be an Extra? Who would use it? This is just Dead Code!

That's why we are going to replace every flash.net.Socket with this class in the SWF. So that's how the hook is going to work.




