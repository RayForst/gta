import Models from '../models'

module.exports = {
    async register(req, res) {
        try {
            const user = await Models.User.create(req.body)
            res.send(user.toJSON())
        } catch (err) {
            res.status(400).send({
                error: 'This email is already in use',
            })
        }
    },
}
