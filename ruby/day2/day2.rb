# Find out how to access files with and without code blocks. What is the benefit of the code block?
file = File.open("tmp.txt", "w+")
file.puts "Testing 123"
file.puts "Testing abc"
file.close

File.open("tmp.txt", "r").each { |line|
    puts line
}

# How would you translate a hash to an array? Can you translate arrays to hashes?
hash = { a: 1, b: 2, c: 3, d: 4 }
print "hash: "; p hash
print "array: "; p hash.to_a
print "array flattened: "; p hash.to_a.flatten

hash_array1 = hash.to_a
print "array to hash again 1: "; p hash_array1.inject(Hash.new) { |letter, number| letter[number.first] = number.last; letter }
print "array to hash again 2: "; p Hash[hash_array1]
hash_array2 = hash.to_a.flatten
print "array to hash flattened: "; p Hash[*hash_array2]

# Can you iterate through a hash?
hash.each { |key, value| puts "key:'#{key}', value:'#{value}'" }

# You can use Ruby arrays as stacks. What other common data structures to arrays support?
puts "queue/deque: "
deque = [].push("1").push("2")
deque.unshift("a").unshift("b")
p deque
puts deque.shift
puts deque.shift
puts deque.pop
puts deque.pop

puts "list: "
list = [1,2,3].insert(2, "c")
puts list
puts "removed: " + list.delete("c")

puts "(rudimentary) bag/set:"
bag = [1,2,3,3,4,5]
p bag
set = bag.uniq
other_set = [3,5]
p set
p set & other_set

puts "(rudimentary) matrix:"
matrix = [[1,2,3],[4,5,6],[7,8,9]]
p matrix
p matrix.transpose

# Print the contents of an array of sixteen numbers, four numbers at a time, using just each. Now, do the same with each_slice in Enumerable
puts ""
sixteen_numbers = [*(1..16)]
i = sixteen_numbers.size
p sixteen_numbers
sixteen_numbers.each do |number|
  p sixteen_numbers[((number-4)...number)] if number % 4 == 0
end
puts ""
sixteen_numbers.each_slice(4) {|slice| p slice}

# The Tree class was interesting, but it did not allow you to specify 
# a new tree with a clean user interface. Let the initializer accept a 
# nested structure with hashes and arrays. You should be able to specify 
# a tree like this: {'grandpa' => {'dad' => 'child 1' => {}, 
# 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }.
class Tree
  attr_accessor :children, :node_name
  
  def initialize(name, children=[])
  	if name.respond_to?('keys') then
  		root_node = name.first
  		name = root_node[0]
  		children = root_node[1]
  	end

  	if (children.respond_to?('keys')) then
  		children = children.map { |child_name, grandchildren| Tree.new(child_name, grandchildren) }
  	end

    @children = children
    @node_name = name
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new( "Ruby", 
  [Tree.new("Reia"), 
   Tree.new("MacRuby")] )

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

ruby_tree2 = Tree.new( {'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })
puts "Visiting a node"
ruby_tree2.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree2.visit_all {|node| puts node.node_name}

# Write a simple grep that will print the lines of a file having any 
# occurrences of a phrase anywhere in that line. You will need to do a
# simple regular expression match and read lines from a file. (This is
# surprisingly simple in Ruby.) If you want, include line numbers.
def ruby_grep (pattern, filename)
	regexp = Regexp.new(pattern)
	i = 1
	File.open(filename, "r").each { |line|
    puts "Line ##{i}: #{line}" if regexp.match(line)
    i = i + 1
  }
  File.close(filename)
end

puts "\n[Ruby Grep]"
ruby_grep("abc", "tmp.txt")
