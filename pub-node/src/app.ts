export const express = require('express');
export const app = express();
const bodyParser = require('body-parser');
const cors = require('cors')

app.use(cors())

const indexRouter = require("./routers/index-router");
const establishmentRouter = require("./routers/establishment-router");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use("/",indexRouter);
app.use("/establishments",establishmentRouter);
