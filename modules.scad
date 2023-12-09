
module sectioned_projection(width, depth, z, height=0.1) {
  intersection() {
    children();
    translate([0, 0, z]) cube([width, depth, height],
      center = true);
  }
}



module four_way_symmetry(distance = 0) {
  for (i = [0: 3]) {
    rotate([0, 0, i * 90])
    translate([distance, 0, 0])
    children();
  }
}


module egg(large_radius, small_radius, height, offset) {
  linear_extrude(height) hull() {
    circle(large_radius, $fn = myfn);
    translate([offset, 0]) circle(small_radius, $fn = myfn);
  }
}


module ring(radius, width, height) {
  difference() {
    cylinder(h = height, r = radius, $fn = myfn);
    translate([0, 0, -(height + bustout) / 2]) cylinder(h =
      height * bustout, r = radius - width, $fn = myfn);
  }
}

