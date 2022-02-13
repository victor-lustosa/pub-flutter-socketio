import { EstablishmentDTO } from "../models/establishment_dto";

const establishment_repository = require("../repositories/establishment-repository");

exports.fetch = async (request: EstablishmentDTO, response: any) => {
    try{
        console.log('request controller: '+request.latitude);
        console.log('request controller: '+request.longitude);
        let establishment_featched = await establishment_repository.find_establishments(request);
        response.status(201).json(establishment_featched);
    } catch (e) {
        response.status(500).json(e);
    }
}