"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var app_1 = require("../app");
var establishment_router = app_1.express.Router();
var controller = require("../controllers/establishment-controller");
establishment_router.get("/", controller.fetch);
module.exports = establishment_router;
