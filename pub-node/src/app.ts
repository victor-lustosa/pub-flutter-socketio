import { Server } from "socket.io";
export const express = require('express');
export const app = express();

const bodyParser = require('body-parser');
const cors = require('cors')
const indexRouter = require("./routers/index-router");
const establishmentRouter = require("./routers/establishment-router");
const io = new Server({ /* options */ });

app.use(cors())

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use("/",indexRouter);
app.use("/establishments",establishmentRouter);
