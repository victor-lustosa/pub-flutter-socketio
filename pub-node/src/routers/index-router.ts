 import {express} from "../app";
const index_router = express.Router();

index_router.get("/", (request:any, response:any) => {
    console.log("Hello World");
    response.send("Hello");
});

module.exports = index_router;
