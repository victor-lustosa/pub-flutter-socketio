"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var app_1 = require("./app");
var porta = process.env.PORT || 3000;
var socket_io_1 = require("socket.io");
var io = new socket_io_1.Server({ /* options */});
app_1.app.listen(porta, function () {
    console.log("Escutando a porta " + porta + "...");
});
