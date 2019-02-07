module.exports = (sequelize, DataTypes) =>
    sequelize.define('About', {
        gallery: {
            type: DataTypes.TEXT,
        },
        gallery2: {
            type: DataTypes.TEXT,
        },
        description: {
            type: DataTypes.TEXT,
        },
        shortDescription: {
            type: DataTypes.TEXT,
        },
    })
