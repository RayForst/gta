import Models from '../models'
import jwt from 'jsonwebtoken'
import config from './../config/config'

function jwtSignUser(user) {
    const ONE_WEEK = 60 * 60 * 24 * 7
    return jwt.sign(user, config.authentication.jwtSecret, {
        expiresIn: ONE_WEEK,
    })
}
module.exports = {
    async login(req, res) {
        try {
            const { login, password } = req.body
            const user = await Models.User.findOne({
                where: {
                    login: login,
                },
            })

            if (!user) {
                return res.status(403).send({
                    error: true,
                    message: 'The login information was incorrect',
                })
            }

            const isPasswordValid = await user.comparePassword(password)

            if (!isPasswordValid) {
                return res.status(403).send({
                    error: true,
                    message: 'The login information was incorrect',
                })
            }

            const userJson = user.toJSON()

            res.send({
                user: userJson,
                token: jwtSignUser(userJson),
            })
        } catch (err) {
            res.status(500).send({
                error: 'An error has occureed trring to log in',
            })
        }
    },
    async registerAdmin() {
        try {
            const user = await Models.User.create(config.admin)
            return user.toJSON()
        } catch (err) {
            return false
        }
    },
}
