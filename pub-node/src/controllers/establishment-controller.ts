import { EstablishmentRepository } from "../repositories/establishment-repository";

export class EstablishmentController {

    static async fetch(request: any, response: any){

        try{
            let establishment_featched = await EstablishmentRepository.find_establishments(request);
            if (establishment_featched !== null)
                return response.status(201).json(establishment_featched);
            else
                return false
        } catch (e) {
            return response.status(500).json(e);
        }
    }
}