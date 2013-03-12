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

"" println
"1. Enhance the XML program to add spaces to show the indentation structure" println
Builder := Object clone
Builder indent := 0
Builder forward := method(
  writeln(indentLevel() .. "<", call message name, ">")
  indent = indent + 1
  call message arguments foreach(
	arg,
	content := self doMessage(arg);
	if(content type == "Sequence", writeln(indentLevel() .. content)))
  indent = indent - 1
  writeln(indentLevel() .. "</", call message name, ">"))

Builder indentLevel := method(
	indentSpaces := ""
	indent repeat(indentSpaces = indentSpaces .. "    ")
	indentSpaces
)

Builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript"))

"" println
"2. Create a list syntax that uses brackets" println
curlyBrackets := method(
    call message arguments
)

{"A", "B", "C"} println

"" println
"3. Enhance the XML program to handle attributes: if the first argument is a map (use the curly brackets syntax), add attributes to the XML program. For example: book({\"author\": \"Tate\"}...) would print <book author=\"Tate\">" println
# Reuse curlyBrackets and atPutNumber from above

curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

Map printAsAttributes := method(
    self foreach(k, v,
        write(" " .. k .. "=\"" .. v .. "\"")
    )
)

Builder := Object clone
Builder indent := 0
Builder forward := method(
  write(indentLevel() .. "<", call message name)
  indent = indent + 1
  isFirst := true

  call message arguments foreach(
  	arg,
    if(isFirst,
    	if(arg name == "curlyBrackets",
      	(self doMessage(arg)) printAsAttributes
       )

       write(">\n")
       isFirst = false
    )

        content := self doMessage(arg)
        if(content type == "Sequence", writeln(indentLevel() .. content))
  )

  indent = indent - 1
  writeln(indentLevel() .. "</", call message name, ">")
  )

Builder indentLevel := method(
	indentSpaces := ""
	indent repeat(indentSpaces = indentSpaces .. "    ")
	indentSpaces
)

doFile("question3.io")