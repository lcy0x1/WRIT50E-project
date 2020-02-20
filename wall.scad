err = 0.01;
w = 10;
H = 50;
R = 1;
$fn=10;
dw = 2;

scale([0.3,-0.3,0.3])
for(i=[-5:5])
    translate([w*i,0,0]){
        color([0.8,0.2,0.2])
                cube([w,dw,H]);
            
        translate([0,dw*2,0]){
            color([0.6,0.6,0.6])
            difference(){
                    cube([w,w,H]);
                    translate([w/2,w/2,-err])cylinder(h=H+err*2,r=R);
            }
            color([1,1,1])
                translate([w/2,w/2,0])
                    cylinder(h=H,r=R);
        }
        color([1,1,0.8])
            translate([0,dw,0])
                cube([w,dw,H]);
            color([0.4,0.4,0.4])
            translate([0,w+dw*2,0])
                cube([w,dw,H]);
    }