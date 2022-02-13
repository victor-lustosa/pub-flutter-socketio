
export const express = require('express');
export const app = express();


const indexRouter = require("./routers/index-router");
const establishmentRouter = require("./routers/establishment-router");
app.use("/",indexRouter);
app.use("/establishments",establishmentRouter);
