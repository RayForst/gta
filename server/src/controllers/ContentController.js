import Models from '../models'

module.exports = {
    async getMeta(req, res) {
        try {
            const meta = await Models.Meta.findOne({
                where: { page: req.query.page },
            })
            res.send(meta.toJSON())
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

            res.send(meta.toJSON())
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
            res.send(meta.toJSON())
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

            res.send(blockInfo.toJSON())
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async saveService(req, res) {
        try {
            let service = req.body.id
                ? await Models.Service.findOne({
                    where: { id: req.body.id },
                })
                : null

            if (service) {
                service.update(req.body)
            } else {
                service = await Models.Service.create(req.body)
            }

            res.send(service.toJSON())
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
    async getService(req, res) {
        try {
            let services

            if (req.body.id) {
                services = await Models.Service.findOne({
                    where: { id: req.body.id },
                })
                res.send(services.toJSON())
            } else {
                console.log('no id')
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
}
