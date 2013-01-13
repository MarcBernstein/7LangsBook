## Find
# Some Io example problems
# http://iolanguage.org/scm/io/docs/IoTutorial.html

# An Io community that will answer questions
# http://stackoverflow.com/questions/tagged/iolanguage

# A style guide with Io idioms
# http://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide

## Answer
# Evaluate 1 + 1 and then 1 + "one". Is Io strongly typed or weakly typed?
(1 + 1) println
# Strongly typed - the following line throws an error
# (1 + "one") println

# Is 0 true or false? What about the empty string? Is nil true or false?
if (0) println		# true
if ("") println		# true
if (nil) println	# false

# How can you tell what slots a prototype supports?
MyObject := Object clone
MyObject mySlot := "Test Slot"
MyObject slotNames println	# list(type, mySlot)

# What is the difference between = (equals), := (colon equals), and ::=
# (colon colon equals)? When would you use each one?
a ::= 1	# newSlot("a", 1)			Creates slot, creates setter, assigns value
a := 1	# setSlot("a", 1)			Creates slot, assigns value
a = 1		# updateSlot("a", 1)	Assigns value to slot if it exists, otherwise raises exception

## Do
# Run an Io program from a file.
# io day1.io

# Execute the code in a slot given its name.
MyObject m := method("Test method" println)
# MyObject m
m2 := MyObject getSlot("m")
m2
# Or
MyObject perform("m")