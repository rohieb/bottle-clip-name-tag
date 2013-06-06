/*
 * Examples for bottle clip name tags.
 * Copyright (C) 2013 Roland Hieber <rohieb+bottleclip@rohieb.name>
 *
 * You can simply comment out one of the examples, adapt it to your needs and
 * render it, or use it to build your own variant.
 *
 * The contents of this file are licenced under CC-BY-SA 3.0 Unported.
 * See https://creativecommons.org/licenses/by-sa/3.0/deed for the
 * licensing terms.
 */

use <bottle-clip.scad>

$fn=50;   // approximation steps for the cylinders

// one name tag for 0.5l Club Mate and similar bottles
bottle_clip(name="Zero Cool");

// one default name tag with a different logo.
//bottle_clip(name="Acid Burn", logo="thing-logos/glider.dxf");

// ...or with a different font:
//bottle_clip(name="Acid Burn", font="write/Letters.dxf");
// ...or with a differnet logo and a different font... you get it.

// Now for something completely different: Longneck bottles.
//bottle_clip_longneck(name="Tom Anderson", logo="thing-logos/glider.dxf");

// vim: set noet ts=2 sw=2 tw=80:
