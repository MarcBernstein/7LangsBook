OperatorTable addAssignOperator(":" , "atPutNumber" )
curlyBrackets := method(
	r := Map clone
	call message arguments foreach(arg,
		r doMessage(arg)
	)
	r
)
Map atPutNumber := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"" ),
		call evalArgAt(1))
)
s := File with("phonebook.txt" ) openForReading contents
phoneNumbers := doString(s)
phoneNumbers keys println
phoneNumbers values println

"" println

Builder := Object clone
Builder forward := method(
  writeln("<", call message name, ">")
  call message arguments foreach(
	arg,
	content := self doMessage(arg);
	if(content type == "Sequence", writeln(content)))
  writeln("</", call message name, ">"))
Builder  ul(
	li("Io"),
	li("Lua"),
	li("JavaScript"))

"" println

# vizzini := Object clone
# vizzini talk := method(
#             "Fezzik, are there rocks ahead?" println
#             yield
#             "No more rhymes now, I mean it." println
#              yield)

# fezzik := Object clone

# fezzik rhyme := method(
# 			yield
#             "If there are, we'll all be dead." println
#             yield
#             "Anybody want a peanut?" println)

# vizzini @@talk; fezzik @@rhyme

# Coroutine currentCoroutine pause

"" println

slower := Object clone
slower start := method(wait(2); writeln("Slowly"))

faster := Object clone
faster start := method(wait(1); writeln("Quickly"))

slower start; faster start;
"" println
slower @@start; faster @@start; wait(3)

"" println
futureResult := URL with("http://google.com") @fetch
writeln("Doing something else while fetching...")
writeln("Block until result is available:")
writeln("fetched ", futureResult size, " bytes.")
