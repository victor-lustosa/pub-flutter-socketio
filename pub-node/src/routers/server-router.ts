import {express} from "../app";
const server_router = express.Router();
import { ServerController } from "../controllers/server-controller";
server_router.get("/", (request:any, response:any) => {
    // ServerController.
    console.log("Hello World");
    response.send("Hello");
});

module.exports = server_router;
