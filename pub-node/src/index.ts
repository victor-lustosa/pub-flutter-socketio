import {app} from "./app";
const porta = process.env.PORT || 3000;
import { Server } from "socket.io";
const io = new Server({ /* options */ });
app.listen(porta, function() {
    console.log(`Escutando a porta ${porta}...`)
});