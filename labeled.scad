/*
 * Calibration tool
 */

 element_width = 8;
 element_length = 20;
 hole_length = 7;
 height = 4;
 
 ////////////////////////////////////////////
 // A single element of the bar. It has a fixed width and depth,
 // specified by the globals element_width and element_height and
 // hole in it with a width as specified with the 'width' parameter.
 // Above the hole a number is put as specified by the 'text' parameter.
 module element(width, text) {
     echo("Width, text: ", width, text);
     difference() {
         union() {
            cube(size = [element_width, element_length, height], center = true);
            translate([0, element_length/2-7, height/2]) 
            linear_extrude(height = 1) text(text, size = 5, font="Liberation Sans:style=Bold", halign = "center"); 
         }
        translate([0, -4, 0]) 
         cube(size = [width, hole_length, height + 2], center = true);
     }
 }
 
 
 for (i = [-3:7]) {
     width = 5 + i * 0.1;
     echo ("Ïteration ", i, "with width", width);     
     translate([i * element_width, 0, 0]) element(width, str(i));
 }
 
 translate([-5 * element_width, 0, 0]) {
     cube(size = [6, 20, height], center = true);
     translate([0, 5, height/2]) linear_extrude(height = 1) 
        text("up", size = 5, font="Liberation Sans:style=Bold", halign = "left", direction = "ttb");
 }