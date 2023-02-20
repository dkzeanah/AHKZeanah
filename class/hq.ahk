
class HQ 
{
    __New(lat, long) {
    ;automatically sets the first half of the total needed information for the destination() method upon creation.
    this.Lat := lat, this.Long := long
    }
    Destination(name, lat, long) {
    ; names a target locations and receives input for the last half of needed information

        object := this[name] := {name:name}
        static p := 0.017453292519943295  ;1 degree in radian
        object.Kilometers := 12742*ASin(Sqrt(0.5 - Cos((lat - this.Lat)*p)/2 + Cos(this.Lat*p)*Cos(lat*p)*(1 - Cos((long - this.Long)*p))/2))  ;Formula borrowed from Internet search
        object.Meters := object.Kilometers*1000  ;meters
        object.Miles := object.Kilometers/1.609344  ;miles
        object.Feet := object.Kilometers/0.0003048  ;feet
        object.Yards := object.Feet/3
        return object.dist := object.miles := Round(object.miles, 2) , object.destination := object.miles := Round(object.miles, 2)
    }
}
