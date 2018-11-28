module.exports = (sequelize, DataTypes) =>
    sequelize.define('CustomerReview', {
        person_name: {
            type: DataTypes.STRING,
        },
        person_position: {
            type: DataTypes.STRING,
        },
        comment: DataTypes.TEXT,
        work_url: {
            type: DataTypes.STRING,
        },
    })
