# LinkedMontage
 A tight Montage that also links the images with linkaxes()

----

 call:
```MATLAB
[SubPlotHandleArray, options] = LinkedMontage( ImCell, TitleStrArray, options )
```

---

This function plots multiple images side by side like montage(), 
but does it using subplot that are conneced with linkaxes() function. This
allows user to zoom into images and move around, while all images move together.
Function also returns the handles to all the subplots, so user can change properties later.

---

## Inputs:
* **ImCell**: Cell array of images to plot.
* **TitleStrArray**: optional. String array of names to each image. Must be of size of input ImCell.
* **options**: Name-Value Pairs. All optional. 
   
  * **FigureHandle**: Figure Handle on which the montage will be plotted.
  * **LinkedAxes**: "on" (default) , "off".
  * **Layout**: Number of rows and columns of images, specified as a 2-element vector of the 
                form [nrows ncols]. If you specify NaN or Inf for a particular dimension, 
                LinkedMontage calculates the value of the dimension to display all images 
                in the montage. For example, if 'Size' is [2 NaN], then the montage will have
                two rows and the minimum number of columns to display all images.
                Defaults to [2 , inf].
   * **ImageRelativeSize**: A positive number LessOreEual to 1. Defaults to 1. The size of each indevidual image, where 1 fills the figure entirely.



## Output: 
* **SubPlotHandleArray**: Array of axes objects. Each corrosponds to the input image with the same index.
* **options**: The same as input options. Returns the configurations that the function used.

---
View my file in MATLAB's File Exchange:

[![View LinkedMontage on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/80976-linkedmontage)