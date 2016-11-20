local rdebug = require "remotedebug"
assert(rdebug.status == "debugger")
local aux = require "debugaux"

print("I'm in debugger")

rdebug.sethook(function(event, line)
	if event == "abc" then
		local f = aux.frame(1)
		print(f)
		print("a=>",f.a)
		print("a.b=>",f.a.b)
		print("a.b.c=>",f.a.b.c)
		print("a.b.c.d=>",f.a.b.c.d)
		print("c=>", f.c)
		print("d=>", f.d)
		print("d[c]=>", f.d[f.c])
		rdebug.hookmask "cr"
	elseif event == "ABC" then
		print(rdebug.getinfo(1).source, line)
	else
		print(event, rdebug.getinfo(1).source, line)
	end
end)
