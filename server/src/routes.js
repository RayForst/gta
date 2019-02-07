const AuthenticationController = require('./controllers/AuthenticationController')
const ContentController = require('./controllers/ContentController')
const ContentWorkController = require('./controllers/content/WorksController')
const { check } = require('express-validator/check')
const multer = require('multer')
const crypto = require('crypto')
const path = require('path')


const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './../uploads')
    },
    filename: function (req, file, cb) {
        crypto.pseudoRandomBytes(16, function (err, raw) {
            cb(null, raw.toString('hex') + Date.now() + path.extname(file.originalname))
        })
    }
})
  
const upload = multer({ 
    storage: storage,
    fileFilter: function (req, file, cb) {
        if (!file.originalname.match(/\.(jpg|jpeg|png|gif)$/)) {
            const error = new Error('Only image files are allowed!')
            error.code = 'LIMIT_FILE_TYPES'

            return cb(error, false)
        }
        cb(null, true)
    }
})
  

module.exports = app => {
    app.get('/status', (req, res) => {
        res.send({
            status: 'up',
        })
    })

    app.post('/admin/login', AuthenticationController.login)

    app.get('/settings', ContentController.getSettings)
    app.post('/settings', [
        check('email')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('contactFormEmail')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('contactFormSubject')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('phone')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('address')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('copyright')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('facebook')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('twitter')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('instagram')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('youtube')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
    ], ContentController.saveSettings)

    app.get('/content/meta', ContentController.getMeta)
    app.post('/content/meta', [
        check('title')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Title should be 255 chars long'),
        check('keywords')
            .isLength({ max: 160 }).withMessage('Keywords should be 160 chars long'),
        check('description')
            .isLength({ max: 160 }).withMessage('Description should be 160 chars long')
    ], ContentController.saveMeta)

    app.get('/content/what-we-do', ContentController.getService)
    app.post('/content/what-we-do', [
        check('title')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Title should be 255 chars long'),
        check('articleTitle')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Article title should be 255 chars long'),
        check('slug')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Slug should be 255 chars long'),
        check('icon')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('shortDescription')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
    ], ContentController.saveService)
    app.delete('/content/what-we-do', ContentController.deleteService)

    app.get('/content/work', ContentWorkController.getWork)
    app.post('/content/work', [
        check('title')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Title should be 255 chars long'),
        check('slug')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Slug should be 255 chars long'),
        check('category')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Slug should be 255 chars long'),
        check('person_name')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Name should be 255 chars long'),
        check('person_position')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Position should be 255 chars long'),
        check('image')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('comment')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 500 }).withMessage('Comment should be 255 chars long'),
    ], ContentWorkController.saveWork)
    app.delete('/content/work', ContentWorkController.deleteWork)

    app.get('/content/block-info', ContentController.getBlockInfo)
    app.post('/content/block-info',[
        check('title')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Title should be 255 chars long'),
        check('caption')
            .isLength({ max: 255 }).withMessage('Сaption should be 255 chars long'),
        check('buttonText')
            .isLength({ max: 50 }).withMessage('Text should be 50 chars long')
    ], ContentController.saveBlockInfo)

    app.get('/content/head', ContentController.getHead)
    app.post('/content/head', [
        check('title')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Title should be 255 chars long'),
        check('caption')
            .isLength({ max: 255 }).withMessage('Сaption should be 255 chars long')
    ],  ContentController.saveHead)

    app.get('/content/about-company', ContentController.getAboutCompany)
    app.post('/content/about-company', [
        check('text')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
    ], ContentController.saveAboutCompany)

    app.get('/content/about', ContentController.getAbout)
    app.post('/content/about', [
        check('description')
            .isLength({ min: 1 }).withMessage('Cannot be empty'),
        check('shortDescription')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
    ], ContentController.saveAbout)

    app.get('/content/customer-review', ContentController.getCustomerReview)
    app.post('/content/customer-review', ContentController.saveCustomerReview)

    app.get('/content/why-us', ContentController.getWhyUs)
    app.post('/content/why-us', [
        check('text')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Should be 255 chars long'),
        check('icon')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('should be 255 chars long'),
    ], ContentController.saveWhyUs)
    app.delete('/content/why-us', ContentController.deleteWhyUs)


    app.get('/content/team', ContentController.getTeam)
    app.post('/content/team', [
        check('fullname')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 100 }).withMessage('Fullname should be 255 chars long'),
        check('position')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 100 }).withMessage('Position should be 255 chars long'),
        check('image')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
    ], ContentController.saveTeam)
    app.delete('/content/team', ContentController.deleteTeam)

    app.get('/contacts', ContentController.getConctactRequest)
    app.get('/contacts/keys', ContentController.getKeySettings)
    app.get('/contacts/read', ContentController.readConctactRequest)
    app.post('/contacts', [
        check('type')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Type should be 255 chars long'),
        check('phone')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Phone should be 255 chars long'),
        check('email')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Email should be 255 chars long'),
        check('fullname')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 255 }).withMessage('Fullname should be 255 chars long'),
        check('message')
            .isLength({ min: 1 }).withMessage('Cannot be empty')
            .isLength({ max: 500 }).withMessage('message should be 500 chars long'),
    ], ContentController.saveConctactRequest)

    
    app.post('/upload', upload.single('file'), (req, res) => {
        res.json({file: req.file})
    })

    app.get('/gallery', ContentController.getGallery)
    app.post('/save-gallery', ContentController.saveGallery)
}
