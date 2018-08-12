# Welcome to Fortran
Fortran is a (very old) programming language primarily used in the computational sciences.
This is probably not the best language if you simply want to learn general all purpose programming (go check out Python or Ruby). 

We are using Fortran because of its use throughout scientific disciplines.
We also believe there are less resources available to new programmers trying to learn Fortran, and hope this project can help fill this gap. 

## Fortran Basics
A Fortran program is simply a file containing commands that the Fortran compiler can understand. 
The Fortran compiler reads the code you have written and tells the computer to execute it. 
In Fortran you will need to write your code, next you compile the code, and then finally you run the code. 

In this lesson we will learn how to do all three of these steps!

###  Writing Fortran Code
Every programming language essential does the same thing.
A person writes specific commands into a file and then asks the computer to execute those commands. 

We therefore need a method of writing code into a file. 
The idea is not very different than using a word processor like Microsoft Word or Google Docs to write text into a document, we just need a different type of software. 

For these lessons you can use any Text Editor (the software we use to write code to a file) you like. 
Remeber, all a text editor does is write text to a file and save it, it does not matter in any way how you do this!

For example your mac already has a built in text editor called TextEdit which you can use for these lessons if you like (just go to your applications to open it). 
If you have never heard of a text editor before and this is all new just use TextEdit!

If you would like to look into some other (freely available) Text Editors I would suggest Atom, Emacs (Aquamacs is the mac verison of emacs), or Sublime to get started. 

#### VIM Text Editor
VIM (aka VI) is a well-known text editor that is also available on your mac (and most machines in general). 
If you already know how to use VIM than go for it (it is my primary text editor). 
If you do not already know how to use VIM than DO NOT use it for these lessons. 
All your text editor needs to do is write text to a file.
VIM is not easy to learn and takes a long time to become efficient.
The purpose of these lessons is not to learn how to write words in a file, it is to learn programming!

#### Integrated Development Environments (IDE)
An IDE is essentially a Text Editor on steroids. 
They can be very useful for writing code and have built in capabilities to help catch mistakes in your code and etc. 
In our opinion an IDE is not necessary for these lessons, if you learn to write code in a generic text editor you can investigate an IDE for more specalized work. 
Fortran is an old programming language you really do not need an IDE to write your code.

If for some reason you really want to use an IDE I would suggest using Xcode (which is probably pre-installed on your mac). 
If you continue programming you will lamost certaintly need to get Xcode at some point and there is nothing wrong with using it to write your Fortran programs if you want.

#### Homework 1
Take some time now to find/choose a text editor. 
Use your text editor to make a new file.
Write a short message in the document telling the world what text editor you used to write the file (and will use for writing your Fortran Programs). 

#### Extra Credit
We are going to need access to a terminal for running our Fortran code. 
At this time please locate the terminal on your mac. 

Applications/Utilities/Terminal


You will need to learn how to use the terminal to some extent (it will become your best friend if you keep programming). 
We will review basic terminal commands as we need them. 

If you are feeling motivated learn to open your terminal and use the following commands:
ls, ls-a, cd, mv, rm, and cp. 
If you can use these commands you know the majority of commands that you will need. 

Bonus points, from the terinal open your Text Editor of choice!

### Compiling Fortran Programs
Now that we have a tool for writing text to a file (we do not know how to write a program yet, but we are close) we need to learn how to compile Fortran Code. 

The computer does not understand English, and the human (probably) does not understand machine code (the language the computer speaks). 
The compiler is essentially a translator to let the programmer and Fortran communicate. 

We are going to install the standard Fortran compiler; gfortran (this is FREE you should not need to pay money for a Fortran Compiler). 
Please note: there are other Fortran compilers (some are not free), gfortran will be sufficient for anyone using these resources to learn.
In general I do my best to never pay for software whenever possible!

You are welcome to go on google and find methods for installing the gfortran compiler yourself.
This may be the hardest part of the course, if you are having trouble getting a compiler to work you may want to ask a friend for help. 

Below I provide a method for getting gfortran that works as of this writing, but this may change in the future and depend on your version of mac os. 
#### Installing the Fortran Compiler
To install gfortran I will be using the terminal. 
Please note; the $ character implies text that you should type into your terminal.
Do not actually write the $, just write the following text into the terminal. 
Once you type the text into the terminal make sur eyou press ENTER to execute the command.

First we will check to see if your computer has a copy of gfortran.
To do this we will ask terminal what version of gfortran it is running.

`$ gfortran -v`

The -v flag (a flag is anything folloing a - in terminal)  asks what version of gfortran terminal is running.
If you do not have gfortran it will throw an error (that is what will probably happen). 
If you get an error message when keep reading.
If for some reason you do have a version of gfortran you can proceed to lesson 01 and see if it works (if not return here). 

#### Installing Software
People spend a-lot of time writing software, and we want to use it.
Unfortunately software has become very compliated, and your computer needs to be very careful when setting it up. 
To make life easy `package managers` handle installing software so we don't have to. 
Essentially a package manager looks at your computer to see what libraries and etc. it has, it then looks at the software you want to download and determines what libraries and depedencies you need to run this new software. 
Then the package manager (hopefully) finds everything you need, downloads it, and then compiles your new software! 

I will use a mac package manager to install gfortran.

#### Xcode
As mentioned above, Xcode is an IDE (integrated developing environment) for mac, and is used for developing software on a mac.
It will give your mac various 'tools' for developing and compiling software. 
To download gfortran we need a package manager, and on the mac os we need Xcode to get the package manager to work (mac needs to use Xcode to run its package manager). 
Therefore we will install Xcode first, and then use our package manager to get gfortran. 

So we need to get Xcode, try 

`$ xcode-select -p`

If you get a result like, Applications/Xcode.app/Contents/Developer, you have Xcode and are good to go. 
If you have it, make sure you have the most current verion (check app store for updates). 

If that terminal command throws you an error, go to the apple store and download Xcode (it is free). 
If for some reason  you cannot download Xcode from the app store  (you probably have an older mac operating system), just search the web for a version of Xcode for your version of mac os. 

Please Note: you should not need to pay for any of these resources, if you need to use money for any of your programming, ask someone if there is a free way to do it!

Now that we have  Xcode, we will also need the command line tools (let Xcode work from command line), try the following. 

`$ xcode-select --install`

Follow the prompts and hopefully everything works. 

If everything workds try the following command on terminal.

`$ gcc -v`

If successful this will give you some text telling you what version of gcc you have.
You don't need to now what gcc is, just know it comes with Xcode, so if you have gcc you will have Xcode working. 

Please Note: This may be dificult, if you have trouble getting these commands to work try to ask a friend for help.
You may need to google various problems you have and find a solution (this is very common when working with computers). 
Do not worry if my directiosn don't work, just find you own way to get gfortran, afterall that is the goal!

If everything worked you should now have Xcode on your machine and we can move on to install the mac os package manager (which we will use to get the Fortran compiler). 

#### Package Manager; Homebrew
Homebrew is the easiest package manager to use for the mac operating system. 
Note: Macports is the other famous package manager, it is older and I suggest using Homebrew.
If you have Macports on your machine, there is a chance Homebrew will have some issues that you will need to fix (if you are not sure don't worry about it just try to get Homebrew).
If you run into problems using Homebrew, again start using google to troubleshoot your problems. 

To install Homebrew I would suggest going to their webpage and follow their directions. 

`https://brew.sh/`

If everything is working you will just copy a line into your terminal that will use the programming language `Ruby` to install Homebrew for you.

$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

IF everything worked and you have successfully downloaded Homebrew try the following 

`$ brew doctor`

Follow the prompts until things seem to be okay. 
Unless you really know what you are doing just agree with Homebrew until it does what you want.

#### Finally.... Installing gfortran 
Now that we have homebrew, installing gfortran (the fortran compiler) is very easy (trust me we can almos start programming!). 

Whenever you use Homebrew you should first check to make sure it is up to date.

`$ brew update`

Now we will install the fortran compiler (again this pesky gcc is involved). 

`$ brew install gcc`

If everything worked we can do the following

`$ which gfortran`

Will tell us where gfortran is hanging out on your computer.

`$ gfortran -v`

If things worked you should not get any error messages when you run these commands!

## Lesson Summary
In this lesson we simply set-up our computer to have the required software to run a Fortran program. 
We need a text editor, basic terminal commands, and the gfortran compiler to execute a Fortran program. 
It is essential that you have the gfortran compiler, if you are unable to complete this lesson go ask for help.
But you will not be able to move on until you have access to a terminal, a text editor, and gfortran. 

Continue to the next lesson to run your first Fortran program!
