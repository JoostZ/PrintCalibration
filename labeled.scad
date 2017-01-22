/*
 * Calibration tool
 */

 element_width = 8;
 element_length = 8;
 hole_length = 7;
 height = 4;
 
 module element(width, text) {
     difference() {
        cube(size = [element_width, element_length, height], center = true);
            cube(size = [width, hole_length, height + 2], center = true);
     }
 }
 
 element(4, null);
     