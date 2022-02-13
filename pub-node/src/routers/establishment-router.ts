import {express} from "../app";
const establishment_router = express.Router();
const controller = require("../controllers/establishment-controller");

establishment_router.get("/", controller.fetch);

module.exports = establishment_router;
