import Models from '../../models'

module.exports = {
    async saveWork(req, res) {
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

            if (req.body.id) {
                works = await Models.Work.findOne({
                    where: { id: req.body.id },
                })
                res.send(works.toJSON())
            } else {
                console.log('no id')
                works = await Models.Work.findAll({
                    raw: true,
                })

                res.send(works)
            }
        } catch (err) {
            res.status(400).send({
                error: 'Something went wrong' + err,
            })
        }
    },
}
