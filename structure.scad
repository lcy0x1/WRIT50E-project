
{
    height = 30;
    width = 40;
    length = 40;
    thick = 2;
    err = 0.01;

    FESH = 7;
    FESD = 5;
    FEST = 0.2;
    BTLR = 0.3;
    BTLH = 1;
    KITW = 2;
    KITL = 3;
    KITH = 2;
    CRSL = 1;

    SPHD = 3;
    SPHH = 3;
    SPHZ = 15;

    LNR1 = 1;
    LNR2=0.7;
    LNH=0.3;

    OXYR = 2;
    OXYD = 0.2;

    CMPL = 2;
    CMPW = 3.5;
    CMPH = 5;
    CMPTL = 7;
    CMPTD = 0.5;

    CHRPX = 0.77;
    CHRPY = 3;
    CHRD = 4;
    CHRH1 = 4;
    CHRH2=8;

    SCRY = 1;
    SCRBL=2;
    SCRBW=1;
    SCRBH=0.1;
    SCRCL=1;
    SCRCW=0.2;
    SCRCH=1;
    SCRSL=6;
    SCRSW=0.3;
    SCRSH=4;

    $fn = 60;
}

scale([1,-1,1]){
    color([1,1,1]){
        difference(){
            cube([length,width,height]);
            translate([thick,thick,thick])
                cube([length-thick+err,width-thick+err,height-thick+err]);
        }
    }

    color([0.5,1,1])
        translate([thick,thick,thick]){
            translate([FESD/2,FESD/2,0])
                cylinder(h=FESH,r=OXYR);
            union(){
                for(i=[0,1])
                    for(j=[0,1]){
                        translate([i*(FESD-OXYD),j*(FESD-OXYD),0])
                            cube([OXYD,OXYD,FESH]);
                        translate([i*(FESD-OXYD),0,j*(FESH-OXYD)])
                            cube([OXYD,FESD,OXYD]);
                        translate([0,i*(FESD-OXYD),j*(FESH-OXYD)])
                            cube([FESD,OXYD,OXYD]);
                    }
            }
        }

    color([1,0.5,1])
        translate([thick+FESD,thick,thick]){
            translate([FESD/2,FESD/2,0])
                cylinder(h=FESH,r=OXYR);
            union(){
                for(i=[0,1])
                    for(j=[0,1]){
                        translate([i*(FESD-OXYD),j*(FESD-OXYD),0])
                            cube([OXYD,OXYD,FESH]);
                        translate([i*(FESD-OXYD),0,j*(FESH-OXYD)])
                            cube([OXYD,FESD,OXYD]);
                        translate([0,i*(FESD-OXYD),j*(FESH-OXYD)])
                            cube([FESD,OXYD,OXYD]);
                    }
            }
        }

    translate([thick+FESD*3,thick,thick]){
        color([0.7,0.7,0.7])
            cube([FESD,FESD,FESH]);
        translate([FESD/2,FESD,FESH/2])
            rotate([-90,0,0])
                color([1,1,1])
                    cylinder(h=LNH,r1=LNR1,r2=LNR2);
        }


    translate([thick+FESD*2,thick,thick]){
        color([1,1,0.5])
            difference(){
                cube([FESD,FESD,FESH]);
                translate([FEST,FEST,FEST])
                    cube([FESD-FEST*2,FESD-FEST+err,FESH/2-FEST*1.5]);
                translate([FEST,FEST,FESH/2+FEST/2])
                    cube([FESD-FEST*2,FESD-FEST+err,FESH/2-FEST*1.5]);
                
            }
        color([1,1,1]){
            translate([FEST,FEST+FESD/2,FEST]){
                for(i = [0:6])
                    translate([BTLR*(2*i+1),BTLR,0])
                        cylinder(h=BTLH,r=BTLR,$fn=20);
                for(i = [0:5])
                    translate([BTLR*(2*i+2),BTLR,BTLH])
                        cylinder(h=BTLH,r=BTLR,$fn=20);
                
            }
            translate([FESD/2-KITL/2,FEST+FESD/2,FESH/2+FEST/2]){
                cube([KITL,KITW,KITH]);
            }
        }
        color([1,0,0])
            translate([FESD/2-CRSL/2,FEST+FESD/2+KITW,FESH/2+FEST/2+KITH/2-CRSL/2]){
                cube([CRSL,err,CRSL]);
            }
    }




    translate([thick,thick,SPHZ-thick]){
        color([0,0,0]){
            cube([SPHD,SPHD,SPHH]);
            
        }
    }
    translate([thick+FESD*4,thick,thick]){
        color([1,1,1]){
            union(){
                for(i=[0,1])
                    for(j=[0,1]){
                        translate([i*(CMPTL-CMPTD),j*(FESD-CMPTD),0])
                            cube([CMPTD,CMPTD,FESH]);
                    }
                translate([0,0,FESH-CMPTD])
                    cube([CMPTL,FESD,CMPTD]);
            }
            translate([CHRPX,CHRPY,0])
            union(){
                cube([CMPTD,CMPTD,CHRH1]);
                translate([CHRD-CMPTD,0,0])
                    cube([CMPTD,CMPTD,CHRH1]);
                translate([0,CHRD-CMPTD,0])
                    cube([CMPTD,CMPTD,CHRH2]);
                translate([CHRD-CMPTD,CHRD-CMPTD,0])
                    cube([CMPTD,CMPTD,CHRH2]);
                translate([0,0,CHRH1-CMPTD])
                    cube([CHRD,CHRD,CMPTD]);
                translate([0,CHRD-CMPTD,CHRH2-CMPTD])
                    cube([CHRD,CMPTD,CMPTD]);
            }
            
        }
        color([0.2,0.2,0.2]){
            translate([CMPTL-CMPL,(FESD-CMPW)/2,0])
                cube([CMPL,CMPW,CMPH]);
            translate([(CMPTL-SCRBL)/2,SCRY,FESH])
                cube([SCRBL,SCRBW,SCRBH]);
            translate([(CMPTL-SCRCL)/2,SCRY+(SCRBW-SCRCW)/2,FESH+SCRBH])
                cube([SCRCL,SCRCW,SCRCH]);
            translate([(CMPTL-SCRSL)/2,SCRY+(SCRBW-SCRSW)/2,FESH+SCRBH+SCRCH])
                cube([SCRSL,SCRSW,SCRSH]);
            
        }
    }
}
