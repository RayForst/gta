//const AuthenticationController = require('./controllers/AuthenticationController')
const ContentController = require('./controllers/ContentController')
const ContentWorkController = require('./controllers/content/WorksController')
//const AuthenticationControllerPolicy = require('./policies/AuthenticationControllerPolicy')
//const UserController = require('./controllers/UserController')

module.exports = app => {
    app.get('/status', (req, res) => {
        res.send({
            status: 'up',
        })
    })

    app.get('/content/meta', ContentController.getMeta)
    app.post('/content/meta', ContentController.saveMeta)
    app.get('/content/what-we-do', ContentController.getService)
    app.post('/content/what-we-do', ContentController.saveService)

    app.get('/content/work', ContentWorkController.getWork)
    app.post('/content/work', ContentWorkController.saveWork)

    app.get('/content/block-info', ContentController.getBlockInfo)
    app.post('/content/block-info', ContentController.saveBlockInfo)
    // app.post(
    //     '/register',
    //     AuthenticationControllerPolicy.register,
    //     AuthenticationController.register
    // )

    // app.get('/user/info', UserController.getInfo)
}
