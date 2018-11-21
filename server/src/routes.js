const AuthenticationController = require('./controllers/AuthenticationController')
const AuthenticationControllerPolicy = require('./policies/AuthenticationControllerPolicy')
const UserController = require('./controllers/UserController')

module.exports = app => {
    app.get('/status', (req, res) => {
        res.send({
            status: 'up',
        })
    })

    app.post(
        '/register',
        AuthenticationControllerPolicy.register,
        AuthenticationController.register
    )

    app.get('/user/info', UserController.getInfo)
}
