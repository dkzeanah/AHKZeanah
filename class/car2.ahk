kingDir, %A_ScriptDir%

; get someones thoughts on a conditional extension of a class...? car could in theory extend HQ, but ultimately, 
; there is no point if the car IS AT the HQ

;class car extends hq
class car  {
    static ppg := 5.00 ;price per gallon
    static mph := 60 ; a practical nominal average standard use number

    __new(mpg, optvar := ""){
        this.mpg := mpg
        this.optvar := optvar
        if (optvar != "") ;should work if optvar passed in
        {
            MsgBox, % "6: `n " optvar " `n was passed in, therefore: " this.drive(mpg, optvar )
            return this
        }
    MsgBox, % "2: `n " home.destination
    return this
}

    drive(mpg, distance){
        this.mpg := mpg
        this.distance := distance
        gasamount := distance / mpg
        timeamount := round((distance / this.mph) * (60*60), 2) ;* wps
        ;timeamount := round(timeamount, 2 ) * 60 . " seconds" := round(timeamount, 2 ) * wps ;. " cents - worth in time "
        MsgBox, % "7: `n "gasamount " gallon of gas `n" gasamount * this.ppg " gas cash value `n" timeamount " seconds of driving `n" . temp := timeamount/60 " minutes of driving. `n " . "$ " . timeamountincash := round( timeamount * wps , 2) . " time converted to cash value."
       ;worked; result := (gasamount * this.ppg) + timeamount
        ;first change; result := round((gasamount * this.ppg) + timeamount , 2)
        ;2nd; result := round((gasamount * this.ppg) + timeamount , 2)
        timeamountincash := round( timeamount * wps , 2)
        result := this.twoway((gasamount * this.ppg ) + timeamountincash )
        MsgBox, % "8: result of a two way trip in both gas and time accounted for `n " result
        return result
        ;worked; return this.twoway(result) ;.round(result, 2)


}        
    twoway(result){
        MsgBox, % "9: resultant price of a twoway trip `n " this.result := result
            result := result * 2
            return result

        }
}

