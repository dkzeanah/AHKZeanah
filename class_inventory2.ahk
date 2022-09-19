#Include P:\app\app\json\json\export.ahk
;#include export.ahk

screwdriver := new inventory("screwdriver", "small tool", 2)
screwdriver.addItems(100)
screwdriver.addItems(66)
screwdriver.addItems(10)
screwdriver.saveStatus()


hammer := new inventory("hammer", "small tool", 2)
screwdriver.addItems(100)
screwdriver.addItems(66)
screwdriver.addItems(10)
screwdriver.saveStatus()
hammer.savestatus()
return


class inventory {
    __New(name, category:="misc", price:=100, stock:=1, source:="") {
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
}