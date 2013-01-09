# Prints the string "Hello, world"
puts "Hello, world."

# For the string "Hello, Ruby," find the index of the word "Ruby"
puts "Hello, Ruby".index('Ruby')

# Print your name 10 times.
10.times {puts "MB"}

# Print the string "This is sentence number 1," where the number 1 changes from 1 to 10.
i = 1
while i <= 10
	puts "This is sentence number #{i}"
	i += 1
end

# Run a Ruby program from a file
def get_guess(r)
	puts "Guess the number from 1-10"
	guess = gets
	check_guess(r, guess)
end

def check_guess(r, guess)
	if guess.to_i < r
		puts "Try higher..."
		get_guess(r)
	elsif guess.to_i > r
		puts "Try lower..."
		get_guess(r)
	else
		puts "You guessed right!"
	end
end

get_guess(rand(10) + 1)