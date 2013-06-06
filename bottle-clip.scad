include <write/Write.scad>

// you don't need to change anything of the variables below, instead see the
// examples at the end of this file.

// defaults for 0.5l Club Mate bottles
// inner radius, upper side (13 mm for 0.5l Club Mate or 0.33l bottles)
ru=13;    // [1,30]
// inner radius, lower side (17.5 mm for 0.5l Club Mate bottles, 15 mm for 0.33l
// bottles)
rl=17.5;  // [1,30]
// total height. Keep at 26 mm for the default 0.5l/0.33l values above.
ht=26;    // [1,30]
// wall thickness. Keep close to 2.5 mm so you can easily clip it to the bottle.
width=2.5; // [2,8]

// default logo and font
// logo DXF should be centered on 50mm*50mm to fit perfectly
logo="thing-logos/stratum0-lowres.dxf";
// font (see Write.scad description page for fonts)
font="write/orbitron.dxf";

$fn=50;   // approximation steps for the cylinders
e=100;    // should be big enough, used for the outer boundary of the text/logo

/**
 * Creates one instance of a bottle clip name tag.
 * Parameters:
 * ru: the radius on the upper side of the clip
 * rl: the radius on the lower side of the clip
 * ht: the height of the clip
 * width: the thickness of the wall. Values near 2.5 usually result in a good
 *	clippiness for PLA prints.
 * logo: The path to a DXF file representing a logo that should be put above
 *	the name. Logo files should be no larger than 50 units in height and should
 *	be centered on the point (25,25). Also all units in the DXF file should be
 *	in mm.
 * font: the path to a font for Write.scad.
 */
module bottle_clip(ru=13, rl=17.5, ht=26, width=2.5,
		logo="thing-logos/stratum0-lowres.dxf", font="write/orbitron.dxf") {
	difference() {
		rotate([0,0,-45]) union() {
			// main cylinder
			cylinder(r1=rl+width, r2=ru+width, h=ht);
			// text
			writecylinder(name, [0,0,0], rl+0.5, ht/13*7, h=ht/13*4, t=max(rl,ru),
				font=font);
			// logo
			translate([0,0,ht*3/4-0.1])
				rotate([90,0,0])
				scale([ht/100,ht/100,1])
				translate([-25,-25,0.5])
				linear_extrude(height=max(ru,rl)*2)
				import(logo);
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


// template for 4 default bottle name tags
translate([ 22, 22,0]) rotate(180) bottle_clip(name="YourName");
//translate([-22, 22,0]) rotate(270) bottle_clip(name="J. Hacker");
//translate([-22,-22,0]) rotate(  0) bottle_clip(name="Acid Burn");
//translate([ 22,-22,0]) rotate( 90) bottle_clip(name="Zero Cool");

// example for 0.33l bottles, different logo and different font
//translate([ 22,-22,0]) rotate( 90) bottle_clip(name="YourName",
//	ru=13, rl=15, logo="yourlogo.dxf", font="Letters.dxf");

// vim: set noet ts=2 sw=2 tw=80:
