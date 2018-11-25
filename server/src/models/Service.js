module.exports = (sequelize, DataTypes) =>
    sequelize.define('Service', {
        title: {
            type: DataTypes.STRING,
        },
        slug: {
            type: DataTypes.STRING,
            unique: true,
        },
        shortDescription: {
            type: DataTypes.STRING,
        },
        icon: {
            type: DataTypes.STRING,
        },
    })
