#requires autohotkey v2.0-
;#Requires AutoHotkey  v1.1.34.03


_obj := {name:"Don", Last:"zeanah"} ;collection of properties
_arr := ['one','two']							;a list of items
_map := Map()						; combo of prop *items* (key,value)
msgbox type(_obj)
msgbox type(_arr)
msgbox type(_map)

mymap := Map(
	'startup', true,
	'minimized', false
)

myMap.IsSaved := false ;a property, cant access with for loop

for k,v in mymap
	MsgBox k

for k,v in mymap.OwnProps()
	MsgBox k

	for k,v in _obj.OwnProps()
	MsgBox k v
;for k,v in _arr




;alt + d to debug, runs using ahk v1 extension, uses v2 launcher
main := Gui()
main.Add('button', 'w75','ok').OnEvent('click', (*)=>msgbox('you pressed:' main.prop)) 
main.prop := main.AddEdit("multi","test")
main.Show()


msgbox("hello")
;MsgBox, % "2: `n " test
return

;object and array v1
; 


