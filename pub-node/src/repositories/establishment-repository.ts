import {Establishment} from "../models/establishment";
import { EstablishmentDTO } from "../models/establishment_dto";
const axios =  require('axios');
const key_tomtom = 'UdNRt25x7SLwYkfpwLByEYnYTCIYlUSw';
const api_tomtom = 'https://api.tomtom.com/search/';


module.exports = class Establishment_Repository {

    // establishmentList:Establishment[] = [];
    private establishmentList: Establishment[] = [];


    async find_establishments(data:EstablishmentDTO) {

        try {
            console.log(data.latitude);
            console.log(data.latitude);
            axios.get(`${api_tomtom}2/nearbySearch/.json?lat=${data.latitude}&`+
                        `lon=${data.longitude}&countrySet=BR%2C%20UTF-8&radius=5000&language=pt-BR&`+
                        `categorySet=9376003%2C%207315039&key=${key_tomtom}`).
            then( (response:any) => {
                    for (let index = 0; index < response.data.length; index++) {
                        this.establishmentList.push(new Establishment(
                                response[index]['poi']['name'],response[index]['position']['lat'], response[index]['position']['lon']
                            )
                        );
                        console.log(this.establishmentList);
                    }
                    // this.establishmentList = response as Establishment[]
                }
            ).catch(function (error:any) {
                console.log(error);
            })
            // const response =  new establishment(new_todo).save();
            return this.establishmentList;
        } catch (e) {
            console.log(`Erro: ${e}`);
        }
    }
}