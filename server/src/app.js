import config from './config/config'
import express from 'express'
import bodyParser from 'body-parser'
import cors from 'cors'
import morgan from 'morgan'
import models from './models'
import expressValidator from 'express-validator'
import path from 'path'

const SERVER_NAME = 'SERVER'
const consoleSay = (author, message) => `${author}: ${message}`
const app = express()

app.use(morgan('combined'))
app.use(bodyParser.json())
app.use(expressValidator())
app.use(cors())
app.use('/img', express.static(__dirname + '/../../uploads'))

require('./routes')(app)
require('./commands')(app)

models.sequelize.sync().then(() => {
    app.listen(config.port)
    console.log(consoleSay(SERVER_NAME, `I'm up on port - ${config.port}`))
})

app.use(function(err, req, res, next) {
    if (err.code === 'LIMIT_FILE_TYPES') {
        return res.status(422).json({ error: 'Only images are allowed'})
    }

    next()
})


console.log(consoleSay(SERVER_NAME, 'Waking up...'))
