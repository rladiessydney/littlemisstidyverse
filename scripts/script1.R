# Everything I do in the LMT tutorial has an associated script, like this one. 
# Each of the scripts covers one task, and aims to explain that task without 
# assuming any pre-existing knowledge (so, if you already know all this stuff
# my apologies... this will go pretty slowly for you!)
#
# So, the first thing, what is a script?
#
# A script is a collection of R commands (a "command" is just an instruction
# to make the computer do something).
#
# When you click the "Source" button above, R will read through the script 
# and try to "execute" all the commands, starting at line 1 and working down
# to line XXX (notice that RStudio shows you the line numbers!)
#
# At the moment, we are on line 15, and I haven't typed any "real" R commands.
# These are all "comments"... when R encounters the # character it doesn't try
# to "do" anything because it assumes the rest of the line is intended only 
# for humans :-)

# So now we will type a command:

print(10 + 20)

# ^ The line above will generate output in the "console" (the panel below!)
# which will say.... [1] 30. The "30" is the important part. Now compare to this:

2 + 7

# You'd think you would see [1] 9 in the output but you won't. R *has* calculated
# the result, but if you want to *see* the result get printed to the console you
# have to use the "print" command

# Instead of printing to screen, we can store the results of command as a variable.
# So I'll add two more commands to this script. First:

my_age <- 40

# Again, nothing will be visible on the screen. However, if you click on the 
# "environent" pane (in the top right) you will see an entry that says "my_age"
# That means that R has created a variable called "my_age". We can use that 
# variable in other commands. So for instance, let's PRINT my level of 
# emotional maturity to the screen:

print(my_age / 10)

# This prints [1] 4 to the console, but doesn't store the result.
