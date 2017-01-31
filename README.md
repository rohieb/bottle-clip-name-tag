Bottle clip with name and logo
==============================

This thing is a simple clip with your name on it which can be used to mark your
bottles.

The clip is customizable and you can tweak the following parameters:

 * name on the clip, font, and optional, logo.
 * height and radius on the upper and lower side, for easy adaptation to other
   bottle types. The script includes examples for standard 0.5l Club Mate (and
   similar) bottles as well as 0.33l longneck bottles and German 0.33l DIN 6199
   (“Steinie”) beer bottles.
 * wall thickness (though the default should be okay for easy clipping)


Instructions
------------

First, get all prerequisites. If you cloned this repository with Git, all you
have to do is `cd` into the repository and do a `git submodule init && git
submodule update`. Otherwise, you need the following:

 * If you want a logo on your name tag, draw a DXF file by yourself, or choose
   one out of my collection at rohieb/thing-logos. Your own logos should be no
   more than 50mm in height, and centered on point (25,25) for optimal results.

Then open `example.scad` in OpenSCAD, read it, choose an example that matches
your expectations, comment it out (remove the `//` on the beginning of the
line) and adapt it to your needs, or create your own. The code itself resides
in `bottle-clip.scad` and should be documented sufficiently.


Ancestry and Licence
---------------

The [original design][thing888] was made by Thingiverse user
[wizard23][wizard23] under [CC-BY-NC-3.0][ccbync30]. [daniel][daniel] first put
the [text][thing18978] and then the [logo][thing23817] on it, both his designs
were [CC-BY-SA-3.0][ccbysa30]. In the direct consequence, the design in this
repo is also [CC-BY-SA-3.0][ccbysa30].
The the [text][textonscad] was replaced by fototeddy

[thing888]: http://www.thingiverse.com/thing:888
[wizard23]: http://www.thingiverse.com/wizard23
[daniel]: http://www.thingiverse.com/daniel
[thing18978]: http://www.thingiverse.com/thing:18978
[thing23817]: http://www.thingiverse.com/thing:23817
[ccbync30]: https://creativecommons.org/licenses/by-nc/3.0/
[ccbysa30]: https://creativecommons.org/licenses/by-sa/3.0/
[textonscad]: https://github.com/brodykenrick/text_on_OpenSCAD
