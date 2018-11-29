module.exports = (sequelize, DataTypes) =>
    sequelize.define('About', {
        description: {
            type: DataTypes.TEXT,
        },
        shortDescription: {
            type: DataTypes.TEXT,
        },
    })
