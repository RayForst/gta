import Models from '../models'

module.exports = {
    async getSettings(req, res) {
        try {
            const meta = await Models.Meta.findAll({
                raw: true,
            })
            const headings = await Models.Head.findAll({
                raw: true,
            })

            res.send(
                meta && headings
                    ? {
                        meta,
                        headings,
                    }
                    : {}
            )
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getMeta(req, res) {
        try {
            const meta = await Models.Meta.findOne({
                where: { page: req.query.page },
            })
            res.send(meta ? meta.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async saveMeta(req, res) {
        try {
            let meta
            let alreadyExists = await Models.Meta.findOne({
                where: { page: req.body.page },
            })

            if (alreadyExists) {
                meta = alreadyExists
                alreadyExists.update(req.body)
            } else {
                meta = await Models.Meta.create(req.body)
            }

            res.send(meta ? meta.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getBlockInfo(req, res) {
        try {
            const meta = await Models.BlockInfo.findOne({
                where: { page: req.query.page },
            })
            res.send(meta ? meta.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async saveBlockInfo(req, res) {
        try {
            let blockInfo
            let alreadyExists = await Models.BlockInfo.findOne({
                where: { page: req.body.page },
            })

            if (alreadyExists) {
                blockInfo = alreadyExists
                alreadyExists.update(req.body)
            } else {
                blockInfo = await Models.BlockInfo.create(req.body)
            }

            res.send(blockInfo ? blockInfo.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async saveService(req, res) {
        try {
            let service = req.body.slug
                ? await Models.Service.findOne({
                    where: { slug: req.body.slug },
                })
                : null

            if (service) {
                service.update(req.body)
            } else {
                service = await Models.Service.create(req.body)
            }

            res.send(service ? service.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getService(req, res) {
        try {
            let services

            if (req.query.slug) {
                services = await Models.Service.findOne({
                    where: { slug: req.query.slug },
                })

                if (services.description) {
                    services.description = services.description.replace(
                        /<style([\S\s]*?)>([\S\s]*?)<\/style>/gi,
                        ''
                    )
                }
                res.send(services.toJSON())
            } else {
                services = await Models.Service.findAll({
                    raw: true,
                })

                res.send(services)
            }
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getHead(req, res) {
        try {
            const meta = await Models.Head.findOne({
                where: { page: req.query.page },
            })
            res.send(meta ? meta.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async saveHead(req, res) {
        try {
            let meta
            let alreadyExists = await Models.Head.findOne({
                where: { page: req.body.page },
            })

            if (alreadyExists) {
                meta = alreadyExists
                alreadyExists.update(req.body)
            } else {
                meta = await Models.Head.create(req.body)
            }

            res.send(meta.toJSON())
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getAboutCompany(req, res) {
        try {
            const meta = await Models.AboutCompany.findOne({
                where: { id: req.query.id },
            })
            res.send(meta ? meta.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async saveAboutCompany(req, res) {
        try {
            let meta
            let alreadyExists = await Models.AboutCompany.findOne({
                where: { id: 1 },
            })

            if (alreadyExists) {
                meta = alreadyExists
                alreadyExists.update(req.body)
            } else {
                meta = await Models.AboutCompany.create(req.body)
            }

            res.send(meta.toJSON())
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getCustomerReview(req, res) {
        try {
            let services

            if (req.body.id) {
                services = await Models.Work.findOne({
                    where: { id: req.body.id },
                })
                res.send(services.toJSON())
            } else {
                services = await Models.Work.findAll({
                    raw: true,
                })

                res.send(services)
            }
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async saveCustomerReview(req, res) {
        try {
            let service = req.body.id
                ? await Models.CustomerReview.findOne({
                    where: { id: req.body.id },
                })
                : null

            if (service) {
                service.update(req.body)
            } else {
                service = await Models.CustomerReview.create(req.body)
            }

            res.send(service ? service.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getWhyUs(req, res) {
        try {
            let services

            if (req.body.id) {
                services = await Models.WhyUs.findOne({
                    where: { id: req.body.id },
                })
                res.send(services.toJSON())
            } else {
                services = await Models.WhyUs.findAll({
                    raw: true,
                })

                res.send(services)
            }
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async saveWhyUs(req, res) {
        try {
            let service = req.body.id
                ? await Models.WhyUs.findOne({
                    where: { id: req.body.id },
                })
                : null

            if (service) {
                service.update(req.body)
            } else {
                service = await Models.WhyUs.create(req.body)
            }

            res.send(service ? service.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getAbout(req, res) {
        try {
            const meta = await Models.About.findOne({
                where: { id: req.query.id },
            })

            if (meta.description) {
                meta.description = meta.description.replace(
                    /<style([\S\s]*?)>([\S\s]*?)<\/style>/gi,
                    ''
                )
            }

            res.send(meta ? meta.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async saveAbout(req, res) {
        try {
            let meta
            let alreadyExists = await Models.About.findOne({
                where: { id: 1 },
            })

            if (alreadyExists) {
                meta = alreadyExists
                alreadyExists.update(req.body)
            } else {
                meta = await Models.About.create(req.body)
            }

            res.send(meta.toJSON())
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getTeam(req, res) {
        try {
            let services

            if (req.body.id) {
                services = await Models.Team.findOne({
                    where: { id: req.body.id },
                })
                res.send(services.toJSON())
            } else {
                services = await Models.Team.findAll({
                    raw: true,
                })

                res.send(services)
            }
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async saveTeam(req, res) {
        try {
            let service = req.body.id
                ? await Models.Team.findOne({
                    where: { id: req.body.id },
                })
                : null

            if (service) {
                service.update(req.body)
            } else {
                service = await Models.Team.create(req.body)
            }

            res.send(service ? service.toJSON() : {})
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
}
