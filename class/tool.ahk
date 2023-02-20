class tool{
    ;__new(Item, ppath:="")
    ;check() 
    ;givevalues(x := "") 
    ;readfile(ath := "")
    ;showfile(data := "")
    ;savetofile()
    ;total()
    
    static tooltotal := 1
    static frontproject := "c:\tester"
    
    
    ;    __New(Item,type,ppath := "", unit := "",price:= "",stock:= 0,source:= ""){
    
        __New(ppath := ""){
            
            tool.tooltotal++
            this.items := {}
            ;this.item := {}
            this.ppath := ppath
            this.unit := unit
            this.price := price
            this.stock := stock 
            this.source := source
    
            if (ppath != ""){
                this.ppath := A_Desktop . "\" . ppath . ".txt"
                this.frontproject := this.ppath
            } else {
                this.ppath :=  A_Desktop . "\project.txt"
                this.frontproject := this.ppath
            }
    
            
    
            if !FileExist(this.ppath){
                FileAppend, % "`n" item "," a_now,  this.ppath
            }
            if (item = "screwdriver"){
                this.timetounscrew := 7.5
            } else if(item = "powerdriver"){
                this.timeToUnscrew := 5 
            }
    
        }
         addItems(param_x := 0){
    
            this.stock += param_x
        }
    
    
        check(){
    
            MsgBox, % "10: `n tool.frontproject: " tool.frontproject . "10: `n this.frontproject: " this.frontproject . "10: `n frontproject: " frontproject . "2: `n " this.timeToUnscrew " seconds"
            return 
        }
    
        givevalues(item, x := 0){
    
           if (!this.items.haskey(item)){
            this.items[item] := x 
            MsgBox, % "0: `n first " x " " item " added "
           }
           else {
            this.items[item] += x
            MsgBox, % "1: `n " x " " item " added" 
           }   
        }
    
        
        readfile(ppath := ""){
            tool.frontproject := this.frontproject
    
            if this.ppath != "" or fileexist(A_Desktop . this.ppath)
            {
                ;MsgBox, % "9: `n " this.frontproject
               ; MsgBox, % "0: `n " this.ppath
               ; this.frontproject := "c:\test"
                ;this.filepath := "C:\Users\dkzea\OneDrive\Desktop" . path
                this.filepath := ppath
                FileRead, Contents, %  ppath ;A_Desktop "/Test.txt"
                StringReplace, Contents, Contents, `r,, All ; makes sure only `n separates the lines
                this.aFile := {} ;this.afile := {}
    
                loop, parse, contents, `n
    {
       temparr := strsplit(A_LoopField, ",")
       if (this.afile[temparr [1]] = "")
          this.afile[temparr [1]] := temparr[2]
       else
       {
          if this.afile[temparr [1]].count() < 1
             this.afile[temparr [1]] := [this.afile[temparr [1]], temparr[2]]
          else
             this.afile[temparr [1]].push(temparr[2])
       }
    }
    
    for k, v in this.Afile
    {
        sum := 0
      if isobject(v)
        for _, value in v
          sum += value
      else
        sum := v
      msgbox, % "the sum of " k " is " sum 
    
    }
    
    ;print(this.afile.sum)
    return this.afile
            }
        }
               
        showfile(data := ""){
            tool.frontproject := this.frontproject
            if (data = ""){
                data := this.readfile(this.frontproject)
            }
              for k, v in this.afile {
                if (v)
                    gui, add, text,, % k ": " v
                    ;gui show,, 
            }
            this.data := data
             for k,v in this.data
            {
                 if (isobject(v)){
                 for k,v in v
                 {
                 this.items.k .= v
                 this.items.k.total += v             
                 }
            gui, add, text, % v          
            }             
            for k,v in A_LoopField
            MsgBox, % "4: `n " k "-" v
    
               
             }
            Gui,+AlwaysOnTop ;Sets the Gui as forward priority in the window hierarchy.
           ; Gui, Color, 000000 ;Sets the Gui color to black
           ; Gui, +Delimiterspace
           ;; Gui, Add, edit,, %sum%
            ;Gui, Add, edit,, %eachvalue%
            ;Gui, Add, Button, x5 y370 w290 gSaveExit, Save and Exit
            Gui, Show
    
            ;saveexit:
            ;msgbox % "press ok to exit"
            return ;this.data
            
        }
        savetofile(){
        tool.frontproject := this.frontproject
    
        for k,v in this.items{
            s .= K "," v "`n"
        }
    
            FileAppend,  %  s , % this.ppath
    
            ;MsgBox, % "0: `n " s
            ;MsgBox, % "0: `n " this.ppath
            ;MsgBox, % "6: `n " this.filepath
            run, % this.ppath
          
    
            return
        }
    
        total(){
                tool.frontproject := this.frontproject
    
                for k,v in data
            {
                MsgBox, % "4: `n " k "-" v
                eachvalue .= v
                total += v 
            }
            return
        }
    
    }