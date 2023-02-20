class inventory {
    __New(name, category:="misc", price:=1.00, stock:=1, source:="") {
        ; read from default filepath if none specified
        if (source == "") {
            this.filePath := A_ScriptDir "\" name ".json"
            FileRead, OutputVar, % this.filePath
            ; if the file was blank
            if (strLen(OutputVar) < 3) {
                this.name := name
                this.category := category
                this.price := price
                this.stock := stock
                this.source := source
                return this
            }
            obj := JSON.parse(OutputVar)
            this.name := name
            this.category := obj.category
            this.price := obj.price
            this.stock := obj.stock
            this.source := obj.source
        }
        return this
    }

    addItems(param_x := 0) {
        this.stock += param_x
    }

    saveStatus() {
        string := JSON.stringify(this)
        msgbox, % string
        FileDelete, % this.filePath
        FileAppend, % string, % this.filePath
    }
    input(){ ;method to add object values via inputbox
        InputBox, inp
        if inp = """"
            {
            return
            } 
        this.stock += inp 
        this.saveStatus()
 
    
}
}