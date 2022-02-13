"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var app_1 = require("../app");
var index_router = app_1.express.Router();
index_router.get("/", function (request, response) {
    console.log("Hello World");
    response.send("Hello");
});
module.exports = index_router;
