

class trip{
;readfile
;showfile
;[] addtofile
    __New(price := ""){
        ;static price :=
     
       
    }
    getpath(){

    }
    readfile(path := "\trips.txt"){
        if path != ""
        {
            this.filepath := "C:\Users\dkzea\OneDrive\Desktop" . path
            FileRead, Contents, % "C:\Users\dkzea\OneDrive\Desktop" . path ;A_Desktop "/Test.txt"
            StringReplace, Contents, Contents, `r,, All ; makes sure only `n separates the lines
            aFile := {}
           
            Loop, Parse, contents , `n
                {
                temp_arr := StrSplit(a_loopfield, ",") ;StrSplit(String, [Delimiters, OmitChars])
                afile[temp_arr [1]] := temp_arr[2] ;whatever temp_arr[1] is, becomes the key for afile i.e, afile[notepadLine1] := notepadLine2
                afile.path := "C:\Users\dkzea\OneDrive\Desktop" . path
                }
            return aFile
        }
        else
        {
            MsgBox, % "0: `n it didn't read the file, path inside object method trip.readfile() is: " path
        }
    }

    showfile(data := ""){
        for k,v in data
        {
        MsgBox, % "4: `n " k "-" v
        eachvalue .= v
        total += v
        }
        Gui,+AlwaysOnTop ;Sets the Gui as forward priority in the window hierarchy.
        Gui, Color, 000000 ;Sets the Gui color to black
        Gui, +Delimiterspace
        Gui, Add, DropDownList,, %total%
        Gui, Add, DropDownList,, %eachvalue%
        Gui, Add, Button, x5 y370 w290 gSaveExit, Save and Exit
        Gui, Show

        return total
    }
    save(price,location){
        MsgBox, % "0: `n " location
        MsgBox, % "0: `n " price
        MsgBox, % "6: `n " this.filepath
        FileAppend,  % "`n" location . "," . price  , % this.filepath

        return

        }
        total(){
            for k,v in data
        {
            MsgBox, % "4: `n " k "-" v
            eachvalue .= v
            total += v
        }
        }
}
saveExit:
for k, v in obj
    for k,v in v
objList .= k "|" v "`n"
MsgBox, 262144, , % objList
FileAppend, %objList%, %A_ScriptDir%\%n% ToolsCount.txt
return