export class Establishment{
    constructor(public nameConstructor:string,public latitudeConstructor:number,public longitudeConstructor:number){
        this.name = nameConstructor;
        this.latitude = latitudeConstructor;
        this.longitude = longitudeConstructor;
    }
    name:string;
    latitude:number;
    longitude:number;
}