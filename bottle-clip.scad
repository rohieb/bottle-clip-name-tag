/**
 * A name tag that can easily be clipped to the neck of your bottle.
 * Copyright (C) 2013 Roland Hieber <rohieb+bottleclip@rohieb.name>
 * forked an extenden by fototeddy 2017
 *
 * See examples.scad for examples on how to use this module.
 *
 * The contents of this file are licenced under CC-BY-SA 3.0 Unported.
 * See https://creativecommons.org/licenses/by-sa/3.0/deed for the
 * licensing terms.
 */

        include <text_on.scad>

/**
 * Creates one instance of a bottle clip name tag. The default values are
 * suitable for 0.5l Club Mate bottles (and similar bottles). By default, logo
 * and text are placed on the name tag so they both share half the height. If
 * there is no logo, the text uses the total height instead.
 * Parameters:
 * ru: the radius on the upper side of the clip
 * rl: the radius on the lower side of the clip
 * ht: the height of the clip
 * width: the thickness of the wall. Values near 2.5 usually result in a good
 *	clippiness for PLA prints.
 * name: the name that is printed on your name tag. For the default ru/rt/ht
 *	values, this string should not exceed 18 characters to fit on the name tag.
 * logo: the path to a DXF file representing a logo that should be put above
 *	the name. Logo files should be no larger than 50 units in height and should
 *	be centered on the point (25,25). Also all units in the DXF file should be
 *	in mm. This parameter can be empty; in this case, the text uses the total
 *	height of the name tag.
 * font: the name of a system font or path to a seperate fontfile
 * ew: eastwest orientation of the name to center it 
 */
module bottle_clip(ru=13, rl=17.5, ht=26, width=2.5, name="",
		logo="", ew=-90, resize=50, font="") {

	e=100;  // should be big enough, used for the outer boundary of the text/logo
	difference() {
		rotate([0,0,-45]) union() {
			// main cylinder
			cylinder(r1=rl+width, r2=ru+width, h=ht);
			// text and logo
			if(logo == "") {
				text_on_cylinder(name, [0,0,3], r1=rl+width, r2=ru+width, h=ht, eastwest=ew,size=9, updown=-10, font=font);
			} else {
                text_on_cylinder(name, [0,0,0], r1=rl+width, r2=ru+width, h=ht, eastwest=ew, size=9, updown=-10, font=font);
				translate([0,0,ht*3/4-0.1])
					rotate([90,0,0])
					scale([ht/100,ht/100,1])
					translate([-25,-25,0.5])
					linear_extrude(height=max(ru,rl)*2)
                    resize([resize,0,0], auto=[true,true,false])
					import(logo);
			}
		}
		// inner cylinder which is substracted
		translate([0,0,-1])
			cylinder(r1=rl, r2=ru, h=ht+2);
		// outer cylinder which is substracted, so the text and the logo end
		// somewhere on the outside ;-)
		difference () {
			cylinder(r1=rl+e, r2=ru+e, h=ht);
			translate([0,0,-1])
				// Note: bottom edges of characters are hard to print when character
				// depth is > 0.7
				cylinder(r1=rl+width+0.7, r2=ru+width+0.7, h=ht+2);
		}
		// finally, substract a cube as a gap so we can clip it to the bottle
		translate([0,0,-1]) cube([50,50,50]);
	}
}

/**
 * Creates one instance of a bottle clip name tag suitable for 0.33l longneck
 * bottles (like fritz cola, etc.). All parameters are passed to the module
 * bottle_clip(), see there for their documentation.
 */
module bottle_clip_longneck(name="", width=2.5,
		logo="", ew="", font="", resize=50) {
	bottle_clip(name=name, ru=13, rl=15, ht=26, width=width, logo=logo, ew=ew, font=font, resize=resize);
}

/**
 * Creates one instance of a bottle clip name tag suitable for 0.33l DIN 6199
 * beer bottles (also known as "Steinie", "Stubbi", "Knolle", etc.). Because of
 * reasons, there is no logo, but all other parameters are passed to the module
 * bottle_clip(), see there for their documentation.
 */
module bottle_clip_steinie(name="", width=2.5) {
	bottle_clip(name=name, ru=13, rl=17.5, ht=13, width=width, logo="");
}

/*
 * Create one instance of a bottle clip name tag suitable for 0.5l DIN 6198
 * bottle (also known as "Euroflasche" or "Euroform 2"). All parameters are
 * passed to the module bottle_clip(), see there for their documentation.
 */
module bottle_clip_euro2(name="", width=2.5,
    logo="") {
  bottle_clip(name=name, ru=13, rl=22.5, ht=26, width=width, logo=logo);
}

// vim: set noet ts=2 sw=2 tw=80:
