import config from './config/config'
import express from 'express'
import bodyParser from 'body-parser'
import cors from 'cors'
import morgan from 'morgan'
import models from './models'
const permittedCrossDomainPolicies = require('helmet-crossdomain')

const SERVER_NAME = 'SERVER'
const consoleSay = (author, message) => `${author}: ${message}`

const app = express()
app.use(morgan('combined'))
app.use(bodyParser.json())
app.use(cors())
app.use(permittedCrossDomainPolicies())


require('./routes')(app)
require('./commands')(app)

models.sequelize.sync().then(() => {
    app.listen(config.port)
    console.log(consoleSay(SERVER_NAME, `I'm up on port - ${config.port}`))
})

console.log(consoleSay(SERVER_NAME, 'Waking up...'))
