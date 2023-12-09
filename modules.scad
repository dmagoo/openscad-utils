bustout = 2;

module four_way_symmetry(distance = 0) {
  for (i = [0: 3]) {
    rotate([0, 0, i * 90])
    translate([distance, 0, 0])
    children();
  }
}

module sectioned_projection() {
  intersection() {
    children();
    translate([0, 0, 2]) cube([outerrad * 2, outerrad * 2, .01],
      center = true);
  }
}


module egg(large_radius, small_radius, height, offset) {
  linear_extrude(height) hull() {
    circle(large_radius); // works fine
    translate([offset, 0]) circle(small_radius); //works fine
  }
}


module ring(radius, width, height) {
  difference() {
    cylinder(h = height, r = radius);
    translate([0, 0, -(height + bustout) / 2]) cylinder(h =
      height * bustout, r = radius - width);
  }
}
