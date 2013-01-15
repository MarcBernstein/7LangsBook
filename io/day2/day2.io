i := 1
while(i <= 11, i println; i = i + 1); "Goes to 11" println
for(i, 1, 11, i println); "Goes to 11 again" println
for(i, 1, 11, 2, i println); "Goes to 11 by twos" println

if (true, "It is true", "it is false") println
if (false) then ("It is true" println) else("it is false" println)

postOffice := Object clone
postOffice packageSender := method(call sender)
mailer := Object clone
mailer deliver := method(postOffice packageSender)
mailer deliver println
postOffice messageTarget := method(call target)
postOffice messageTarget println
postOffice messageArgs := method(call message arguments)
postOffice messageName := method(call message name)
postOffice messageArgs("one", 2, :three) println
<<<<<<< HEAD
postOffice messageName println
=======
postOffice messageName println

## Do
# 1. Write a program to find the nth Fibonacci number. Fib(1) is 1,
# and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.
doFib := method(
	number,
	if(((number == 1) or (number == 2)),
		return 1
	);

	number1 := 1
	number2 := 1
	total := 0

	for (i, 3, number, 1,
		total = (number1 + number2)

		number2 = number1
		number1 = total
	)

	total
)

doFib(1) println
doFib(2) println
doFib(3) println
doFib(4) println
doFib(5) println
doFib(6) println
doFib(7) println
doFib(8) println
doFib(9) println
doFib(10) println

# 2. How would you change / to return 0 if the denominator is zero?
(1 / 0) println	# Prints 'inf'

# Save reference to original method
Number origDiv := Number getSlot("/")
# If denom is 0 return 0, else use original method
Number / = method(denom, if(denom == 0, 0, self origDiv(denom)))
(1 / 1) println # Prints 1
(1 / 0) println	# Prints 0

# 3. Write a program to add up all the numbers in a two-dimensional array.
addUp2DArray := method(
	array,

	total := 0
	arrayFlattened := array flatten

	# Doesn't check array size or if object is a number
	arrayFlattened foreach(index, value,
		total = total + value
	)

	total
)

addUp2DArray(list(1,2,3)) println
addUp2DArray(list(1,2, list(3), 4,5)) println

# 4. Add a slot called myAverage to a list that computes the average of
# all the numbers in a list. What happens if there are no numbers in a
# list? (Bonus: Raise an Io exception if any item in the list is not a number.)
List myAverage := method(
	total := 0
	listFlattened := self flatten

	listFlattened foreach(index, value,
		if(value asNumber isNan,
			Exception raise(
				"NonNumericValue",
				"A non-numeric value [" .. value .. "] was encountered during the " .. (call message() name()) .. " operation."
			)
		)

		total = total + value
	)

	total / listFlattened size
)

"Averaging the numbers in a list" println
list(1, 2, 3, 4) myAverage println
#list("a", 2, 3, 4) myAverage println # Throws exception

# 5. Write a prototype for a two-dimensional list. The dim(x,y) method
# should allocate a list of y lists that are x elements long,
# set(x, y, value) should set a value, and get(x, y) should return that value.
List2D := List clone

List2D dim := method(x, y,
	self setSize(x)
	for (i, 0, x - 1, 1,
		self atPut(i, list setSize(y))
	)
	#y repeat(self append(Range 0 to(x) asList() map(nil)))
)

List2D set := method(x, y, value,
	self at(x) atPut(y, value)
)

List2D get := method(x, y,
	self at(x) at(y)
)

testList2D := List2D clone
testList2D dim(2, 2) println	# Returns list(list(nil, nil), list(nil, nil))
testList2D set(1, 0, 100)
testList2D println						# Returns list(list(nil, nil), list(100, nil))
testList2D get(1, 0) println	# Returns 100
testList2D get(0, 0) println	# Returns nil

# 6. Bonus: Write a transpose method so that
# (new_matrix get(y, x)) == matrix get(x,y) on the original list.

# 7. Write the matrix to a file, and read a matrix from a file.
# write
file := File with("matrix.txt")
file remove
file openForUpdating
file write(testList2D join(", "))
file close
"Wrote: " println
testList2D println

# read
file = File with("matrix.txt")
file openForReading
lines := file readLines
file close
testList2DFromFile := lines at(0) split(", ")
"Read:" println
testList2DFromFile println

# Write a program that gives you ten tries to guess a random number
# from 1-100. If you would like, give a hint of "hotter" or "colder"
# after the first guess.
rnd := ((Random value) * 100 + 1) floor
tries := 0
guess := 0
previousGuess := nil
while (tries < 10 and guess != rnd,
	("Guess a number between 1 and 100: (guess #" .. (tries + 1) .. " / 10): ") print
    guess = ReadLine readLine asNumber

    if (previousGuess,
    	if((rnd - guess) abs >= (rnd - previousGuess) abs,
				"Colder..." println,
    		"Hotter..." println
    	)
    )
    tries = tries + 1
    previousGuess = guess
)

if(guess == rnd,
	"You guessed correctly!" println,
	"Out of tries, please play again." println
)
>>>>>>> 76bd1cc24c671831951d1c0617debc5b77aa9bee
