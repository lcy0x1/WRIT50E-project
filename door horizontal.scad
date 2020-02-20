op = 20;
w = 40;
h = 40;
l0 = 2;
fw = op+w;
fh = 1;
fl = 20;
xop = 3;
l1 = l0/2;
xw = 20;
lay = 6;
xh = h/lay;

color([0.8,0.8,0.8]){
    translate([op,-l0/2,0])cube([w,l0,h]);
    translate([-op-w,-l0/2,0])cube([w,l0,h]);
    translate([-fw,-fl,-fh])cube([fw*2,fl*2,fh]);
    translate([-fw,-fl,h])cube([fw*2,fl*2,fh]);
}

color([1,1,1]){
    
    for(i = [0:lay-1]){
        dop = xop*(lay-i);
        translate([dop,-l1/2,xh*i])cube([xw,l1,xh]);
        translate([-dop-xw,-l1/2,xh*i])cube([xw,l1,xh]);
    }

}
