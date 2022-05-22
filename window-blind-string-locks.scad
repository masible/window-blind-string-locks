

thickness_peg = 2.8;
thickness_large = 3.3;
thickness_flat = 1.4;

width_peg = 5.5;
width_peghole = 3.4;
width_slant = 15.4;
width_total = 16.9;

with_countersink = 1;

screw_head_height = 2.9;
screw_head_top_r = 6.9;
screw_head_bottom_r = 2.7;

// No changes after this
$fn = 64;
total_thickness = thickness_peg + thickness_large;

module lock () {
difference() {
    union() {
        cylinder(h = total_thickness, d = width_peg);
        translate([0, 0, thickness_peg]) union() {
            cylinder(h = thickness_large - thickness_flat, d1 = width_slant, d2 = width_total);
            translate([0, 0, thickness_large - thickness_flat]) cylinder(h = thickness_flat, d = width_total);
        }
    }
    translate([-0.1, 0, 0]) cylinder(h = total_thickness * 2, d = width_peghole);
}
}
if (with_countersink) {
    difference() {
        lock();
        translate([0, 0, total_thickness - screw_head_height]) cylinder(h = screw_head_height, d2 = screw_head_top_r, d1 = screw_head_bottom_r);
    }
} else {
    lock();
}