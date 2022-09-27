

#Requires AutoHotkey v2.0-beta.7
;#Requires AutoHotkey v2.0-beta
esc::ExitApp


/*arr := ["first value", 250, variable]

mappy := map(
	"Key", "value",
	"hammer", "nail",
	"pen", "paper"
	)

arr.Length
arr.push()
arr.pop()

mappy.caseSense 
mappy.count 
mappy.has()

obj := {prop1: "value", prop2: 100}

*/
obj:= {
	meth: msgbox.bind()
}

obj.meth()

funk(){
	name := "hammer",
	price := 19.00 
	subject := "metalworking"
	return {name:name ,price:price,subject:subject}
}

obj := funk()

msgbox('help, ima' obj.name "i cost " obj.price "and used for " obj.subject )

;arrow func
settimer(() => msgbox("hi"), -1000)

;bind method
settimer(msgbox.bind("hi"), -1000)

;both
settimer(boundfunky.bind("joe"), -1000)

boundfunky(text){
	msgbox(text)
}

;-----------------------------------------------------------
;; creating a function object "that already has parameters set".

funky(text){
	msgbox(text)
}

;this is a type of object thats called a {bound function}
shoutyall := funky.bind("hey, yall")

shoutyall()



numpad0::
{
	mygui := gui()
	fakelink := mygui.add("text", "", "click2launch")
	fakelink.setfont("underline cblue")
	fakelink.onevent("click", launchgoogle)

	mygui.add("hotkey", "vChosenHotkey", "enter")

		mygui.add("link",, 'click <a href="www.google.com">here </a> to launch google.')
		mygui.show()




}

numpad1::
{
	guiobj := gui()
	guiobj.setfont("s20","Times New Roman")
	guiobj.add("text",,"some text")
	guiobj.show("autosize")
}

launchgoogle(*){
	run("www.google.com")
	}