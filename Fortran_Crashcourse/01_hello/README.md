# Lesson 01: A First Program
If you did not complete Lesson 00, you will need to go back and make sure you have all the necessary software to run Fortran programs. 
You need a working version of `gfortran` and a text editor for this (and all future lessons). 

In this lesson we are going to write our first Fortran Program. 
This lesson will be short, but make sure you understand everything.
All other Fortran programs will be compiled and executed in a very similar manner.

# Objective
1. Use a text editor to write our first program. 

2. Use the Fortran compiler `gfortran` to compile our program.

3. Execute our first program. 

# Using the Lessons
Each directory will contain a Readme file with notes.
I suggest quickly reading the Readme file to understand the purpose of the lesson. 
There will usually then be a Fortran program (`name.f90`) for the lesson. 
It is your job to open your text editor and type the program line by line.
`Do Not` copy and paste the code, write it yourself (you need to pay attention to details while programming, and this will help).
When you try to run the code and have an error try to fix it!
Add comments to the code and understand what every single line is doing.
Play with the code, change things, break it, and then fix it. 

All of the code we provide will be very heavily commented, explaining what we are trying to do, and what potential issues you need to be aware of. 

## Programs in Fortran
We are going to write our programs in the Fortran 90 language. 
This refers to the version of Fortran developed in 1990, any file with the extension f90 is a fortran 90 formatted file. 

`name.f90`

The general work-flow for writing and executing a Fortran program is:

1. Write your program! 
Open a text editor and write some Fortran code. 

2. Compile your code!
Use gfortran to compile the code you have written.

3. Execute your code!
Run the compiled code and get your output. 

In this lesson we will work through each of these steps with a simple program. 

### Directories
A directory (aka folder) is a convenient way to organize your work. 
Do not be messy with your computer, you need to learn to organize your work in an efficient manner (this will allow you to easily automate tasks, and organize your work). 

I suggest making a folder in your Documents directory to hold all of these lessons (or in any other location, jsut keep everything together). 
To do this open up the terminal and type the following commands. 

`$ cd ~/Documents`

`$ mkdir fortran_course`

`$ cd fortran_course`

This will make a folder called fortran_course inside your Documents folder.
All of your exercises should go within this folder.
Let's now make a folder for lesson 1.

`$ mkdir 01_hello`

`$ cd 01_hello`

We are now at the following location in our computer:
`~/Documents/fortran_course/01_hello`

Complete lessons 1 inside of this folder (and make sure you understand all of the terminal commands we used to do this).

## Hello World Program
We are now ready to write our first program!

1. Open your favorite text editor and make a file named `00_hello.f90` (this should be inside the 01_hello directory). 
Inside of this file TYPE (not copy paste) all of the text found inside the github file with the same name.

2. Once you have made 00_hello.f90, go to your terminal (it should be at the same location as 00_hello.f90). 
Type `$ ls` on the terminal (do not actually type the $ character, this tells you to write something in your terminal) and make sure 00_hello.f90 appears (if not go find it).

We are now going to compile the hello.f90 file.
To do this we simply call on gfortran (which we got in Lesson 00). 
Type the folloing into terminal:

`$ gfotran 00_hello.f90`
If your code has any errors you will get a message, go and fix them.
If not you should now have a new executable file called `a.out`.
This out file contains all of your commands in machine code, which will allow the computer to read it and execute your program. 

3. Executing the Code.
To execute (run) the program we type the following:

`$ ./a.out`

And you should have successfuly run your first Fortran program!
