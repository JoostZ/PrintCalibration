# PrintCalibration
OSCAD files for calibration models for 3D printing
## Fitment Test
This file generates a tool that can help to calibrate the XY calibration of your 3D printer if you want to have an accurate fit of the parts you print.
### The problem
The accuracy with which the object is printed is, obviously, determined by the accuracy of the printer itself, e.g., the stepper motors and transmission of these motors to the printer head. However, for the accuracy in the XY direction there is an additional influence by the way the filament is fed into the printer head.

A 3D printer will lay down a path of filament on each Z-level. The width of the filament layed down is determined by
- The diameter of the filament
- The speed at which the filament is extruded
- The speed with which the head is moving

The slicer software will determine the extrusion speed from the fiulament size and the requested head speed in order to create the requested track width.

Note that the nozz;e size is not mentioned here! Of course it plays some role but the track width can be bigger or smaller than the nozzle size. However, the requested size should be close to the nozzle size.

For the edges of the object to print the slicer software will need to place the head not on the edge but half the track thickness *inside* the edge. That way the outside of the trsack will be exactly on the edge.

But what if something goes wrong and the track width is not exactly what the slicer software expects it to be.

Suppose that the requested track width is `w` but the actual width is `w + x`. The slicer software will put the head `0.5w` inside the edge but the edge of the track will extend `0.5(w + x)`from the position of the nozzle and so the object will extend `0.5x`outside the edge of the object.

The model created by this file will help you determine `x`sothat you can correct for it in either your mode definition or in the slicer software.
### Measuring the track width
The `TrackWidthCalibration.scad` file creates a 3D model that consists of two objects.
- A bar with (square) holes in it. Each hole differs `0.1mm` in width from its neighboures.
- A peg with a width (in the Y-direction!) of `5mm` which is the *design width*.

The holes in the bar have a number printed above them. These indicate how much wider (or smaller) the hole is. The hole marked with `0` has exactly the design width (`5mm`). The hole marked with `3`has a width of `5 + 3*0.1` and in general a hole marked with `N`has a width of `5 + N * 0.1`. Note that `N` can also be negative, meaning that the width is smaller than the design width. The peg has a width of `5mm`and so it will fit snugly in the whole marked with `0`.

Now lets look at the scenario where `x`is not zero, so the track width deviates from the setup width. The peg now has a width of `5 + x mm` (remember that each of the two sides are `0.5x`wider!). Each of the holes in the bar have a width of `5 + 0.1 N - x mm`. If the peg fits in the hole marked with `N` then we know that `5 + 0.1 N - x = 5 + x` or `x = 0.05N`.
### Using the calibrator
- Set the slicer software to its default settings
- Print the model
- Try to put the peg in one of the holes, selecting the hole where the peg *just* fits. Note keep the text on the pegtowards you (if the numbers on the bar are awy from you). 
- Calculate the width of the deposited filament with`x = 0.05N`.

