Welcome to your first LaTex example!

main.tex is the file you will want to open, copy into a blank sharelatex project, and compile. 

As of 4/10/17 do this by selecting new project in sharelatex and choose blank project. 
Give the project a name, and you should see a window with 3 pannels. 

The far left has the name main.tex, this is where you will save various files such as pictures you want to load into your document, and references. 

There should then be a texteditor (starts with documentclass command). 
Delete everything in here and paste my example main.tex file in this area. 

If you click recompile you will have some errors, we need to import the images and references called in the LaTex file. 
To do this click the upload button on sharelatex (upper left corner under menu) and upload the following.
equ1_plots.png
equ2_plots.png
fig1.png

So go to the github link, click download, right click save-file (DO NOT CHANGE THE NAME or EXTENSION). 
Now that you have the file saved, just drag it into the upload box by clicking the upload command in the upper left corner of sharelatex. 

We are almost done, but we need our references. 

On the github page open the references.bib file and click raw (upper right corner), this will give you the text in the file. 
Now on sharelatex click on the new file (next to the upload command), name it references.bib. 
Inside this file paste the text from github. 

After all this is done, you should be able to compile the file no problem!


Note if you have any errors, look at the errror message, my guess is that the name of the figure of reference file is incorrect.
If this is the case, right click the image and rename it to the appropriate name.
