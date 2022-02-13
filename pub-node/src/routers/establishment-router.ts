import {express} from "../app";
const establishment_router = express.Router();
import { EstablishmentController } from "../controllers/establishment-controller";

establishment_router.get("/", EstablishmentController.fetch);

module.exports = establishment_router;
