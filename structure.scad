// time variables
t0 = (sin($t*360)+1)/2; // door open

// parameters
boxWidth = 20;
boxLength = 20;
boxHeight = 30;
wallThick = 0.5;
doorWidth = 10;
err = 0.01;

color([ 1, 1, 1, 1 ])
{

    difference()
    {
        // Exterior Cube
        cube([ boxWidth, boxLength, boxHeight ], true);

        // Interior Volume
        translate([ wallThick / 2, 0, 0 ]) cube(
            [
                boxWidth - wallThick * 3,
                boxLength - wallThick * 2,
                boxHeight - wallThick * 2
            ],
            true);

        // Door Open
        translate([ boxWidth/2 - wallThick / 2, 0, 0 ])
            cube([ wallThick + err, boxLength / 2, boxHeight - wallThick * 2 ],
                 true);
    }
}

color([ 0, 1, 1, 1 ])
{
    adv = boxWidth / 2 - wallThick * 3 / 2;
    hei = boxHeight - wallThick * 2;
    wid = boxLength / 4;
    t = wid / 2 + t0 * (wid - wallThick);
    translate([ adv, t, 0 ]) cube([ wallThick, wid, hei ], true);
    translate([ adv, -t, 0 ]) cube([ wallThick, wid, hei ], true);
}
