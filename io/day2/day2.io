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
postOffice messageName println