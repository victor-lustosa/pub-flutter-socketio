import {Establishment} from "../models/establishment";
const axios =  require('axios');
const key_tomtom = 'UdNRt25x7SLwYkfpwLByEYnYTCIYlUSw';
const api_tomtom = 'https://api.tomtom.com/search/';

export class EstablishmentRepository {

    private static establishmentList: Array<Establishment> = new Array<Establishment>();

    static  async find_establishments(data:any) {
        let res
        let  result = await axios.get(`${api_tomtom}2/nearbySearch/.json?lat=${data.query.latitude}&lon=${data.query.longitude}&countrySet=BR%2C%20UTF-8&radius=5000&language=pt-BR&categorySet=9376003%2C%207315039&key=${key_tomtom}`)
        try{
            res  = result.data['results']
            for (let index = 0; index < res.length; index++) {
                this.establishmentList.push(new Establishment(res[index]['poi']['name'], res[index]['position']['lat'], res[index]['position']['lon']
                ));
            }
            console.log(this.establishmentList);
            return this.establishmentList;
        }catch (e){
            console.log(e)
        }
    }
}
