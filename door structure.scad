w = 10;
dw = 1;
ew = 0.2;
h = 10;
l0 = 0.2;
l1 = 1;

color([1,1,1])cube([w,l0,h]);
color([1,1,0.8])translate([dw,l0,0])cube([w-dw,l1*3,h]);
color([0.6,0.6,0.6])translate([0,l0,0])cube([dw,l1,h]);
color([1,0.6,0.6])translate([0,l0+l1,0])cube([dw,l1,h]);
color([0.6,1,0.6])translate([-ew,l0+l1*2,0])cube([dw+ew,l1,h]);
color([0.2,0.2,0.2])translate([0,l0+l1*3,0])cube([w,l1,h]);