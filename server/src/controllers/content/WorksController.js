import Models from '../../models'
const { validationResult } = require('express-validator/check')

module.exports = {
    async saveWork(req, res) {
        const errors = validationResult(req)
        if (!errors.isEmpty()) {
            return res.status(422).json({ errors: errors.array() })
        }

        try {
            let work = req.body.id
                ? await Models.Work.findOne({
                    where: { id: req.body.id },
                })
                : null

            if (work) {
                work.update(req.body)
            } else {
                work = await Models.Work.create(req.body)
            }

            res.send(work.toJSON())
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getWork(req, res) {
        try {
            let works

            if (req.query.slug) {
                works = await Models.Work.findOne({
                    where: { slug: req.query.slug },
                })

                if (works.description) {
                    works.description = works.description.replace(
                        /<style([\S\s]*?)>([\S\s]*?)<\/style>/gi,
                        ''
                    )
                }
                let gallery = await Models.ImageGallery.findOne({
                    where: { 
                        keyword: 'work-'+works.id 
                    },
                })

                works = works.toJSON()

                if (gallery) {
                    works.gallery = gallery.dataValues.images
                } else {
                    works.gallery = false
                }

                
                res.send(works)
            } else {
                works = await Models.Work.findAll({
                    raw: true,
                })

                for (let i = 0; i < works.length; i++) { 
                    let gallery = await Models.ImageGallery.findOne({
                        where: { 
                            keyword: 'work-'+works[i].id 
                        },
                    })

                    if (gallery) {
                        works[i].gallery = gallery.dataValues.images
                    } else {
                        works[i].gallery = false
                    }
                }

                res.send(works)
            }
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async deleteWork(req, res) {
        try {
            await Models.Work.destroy({
                where: { id: req.query.id },
            })
            res.send({})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
}
