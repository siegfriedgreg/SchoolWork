==================================================================================

   ============================================================================


				IMAGE LOADER 0.4.D
				  Greg Siegfried
			       Comp 1525 Spring 2017

    ImageLoader is a simple program that will read in .ppm and .pgm files and 
copy the image to another directory.  The program is command line based and the
default settings are as follows: 

    "./ImageLoader -i [fileName] -o [fileName] [options] "
         Options:
	 '-c' = To Copy image 
         '-fC' = To find Connected-Components
         '-g 1.5' = To Gamma correct (0.2 - 2.0)
         '-pL 45' = To lighten Pixel (10 - 200)
         '-pD 74' = To darken Pixel (10 - 200)

    The ImageLoader class takes care of the header file information extraction,
as well as selecting how to extract the data from the range of image types 
(ASCII or BINARY).  The save function will take the image data from that file and 
fill in the necessary header information required along with a generic comment, 
and then the image data.

    Version 0.6.G:
    The image loader has now been split into two classes, with one class for PPM or
PGM file types.  I also fixed the connected components algorithm to be able to work
on corner and side elements.  

    Version 0.4.D:
    The ImageLoader class can now search for small connected components in a .ppm
image.  The image should consist of a black background and connected components
should be white in color.  The algorithm will identify all components in the image
and label them one of 6 color combinations.  Three test files have been added to the
example folder, and the processed output files are in the output folder.  	


    Version 0.2.A:  
    The ImageLoader class can now adjust pixel values to adjust the gamma values
as well as directly adjusting the brightness and darkenss of the image. 

            For best results stay within the recomended ranges!

Gamma Correction:  can be any value from 0.2 to 2.0 and accessed with the ^ sign.

Brighten: can be any value from 10 to 200 and accessed with the + sign.

Darken: can be any value from 10 to 200 and accessed with the - sign.

Copy:  you can copy the original image to save original image integrity and 
	accessed with the = sign.



   =============================================================================

===================================================================================
