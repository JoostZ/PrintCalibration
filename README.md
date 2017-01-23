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
