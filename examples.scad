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

/*
 * Set the color to render and export.
 * ALL will render all colors.
 */
//CURRENT_COLOR = "ALL";
//CURRENT_COLOR = "black";
//CURRENT_COLOR = "green";

include <bottle-clip.scad>

$fn=50;   // approximation steps for the cylinders

// one name tag for 0.5l Club Mate and similar bottles
bottle_clip(name="Zero Cool");

// one default name tag with a different logo.
//bottle_clip(name="Acid Burn", logo="thing-logos/glider.dxf");

// ...or with a different font:
//bottle_clip(name="Acid Burn", font="write/Letters.dxf");
// ...or with a differnet logo and a different font... you get it.

// ...or with a different gap angle of 45 instead of 90 degrees:
//bottle_clip(name="Crash Override", gap=45);

// Now for something completely different: Longneck bottles.
//bottle_clip_longneck(name="Tom Anderson", logo="thing-logos/glider.dxf");

// ...or DIN 6199 ("Steinie") beer bottles. Note that these have no logo.
//bottle_clip_steinie(name="ohbier");

// without logo, half the height. this is useable with both
// NRW-bottles and Euro-bottles (shorter 0.5l bottles,
// especially beer bottles in bavaria)
//bottle_clip(name="ohbier", logo="", rl=31/2, ru=27/2, ht=13.1);

// without logo, half the height, for weissbier glasses
//bottle_clip(name="ohbier", logo="", rl=48/2, ru=48/2, ht=13.1);

// without logo, for glass "masskrug" handle.
// oval shape: d1=21mm, d2=18mm
//scale([18/21,1,1]) rotate(-45) bottle_clip(name="ohbier", logo="", rl=21/2, ru=21/2, ht=13.1);

// ...or just do your own variant: Measure the diameter of your bottle at two
// different heights, and pass those as parameters rl (lower radius), ru
// (upper radius) and ht (height) to the bottle_clip() module. You can also
// use the other parameters from above, if you set logo="", then only the text
// is rendered.
//bottle_clip(name="Niobe", rl=15, ru=12, ht=16, logo="");

// With color:
//bottle_clip(name="Zero Cool", bg_color="black", text_color="green", logo_color="green");

// vim: set noet ts=2 sw=2 tw=80:
