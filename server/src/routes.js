const ContentController = require('./controllers/ContentController')
const ContentWorkController = require('./controllers/content/WorksController')

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

    app.get('/content/head', ContentController.getHead)
    app.post('/content/head', ContentController.saveHead)

    app.get('/content/about-company', ContentController.getAboutCompany)
    app.post('/content/about-company', ContentController.saveAboutCompany)

    app.get('/content/customer-review', ContentController.getCustomerReview)
    app.post('/content/customer-review', ContentController.saveCustomerReview)

    app.get('/content/why-us', ContentController.getWhyUs)
    app.post('/content/why-us', ContentController.saveWhyUs)

    // app.post(
    //     '/register',
    //     AuthenticationControllerPolicy.register,
    //     AuthenticationController.register
    // )

    // app.get('/user/info', UserController.getInfo)
}
