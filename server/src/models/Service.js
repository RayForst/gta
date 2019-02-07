module.exports = (sequelize, DataTypes) =>
    sequelize.define('Service', {
        title: {
            type: DataTypes.STRING,
        },
        articleTitle: {
            type: DataTypes.STRING,
        },
        slug: {
            type: DataTypes.STRING,
            unique: true,
        },
        shortDescription: {
            type: DataTypes.STRING,
        },
        description: {
            type: DataTypes.TEXT,
        },
        description2: {
            type: DataTypes.TEXT,
        },
        icon: {
            type: DataTypes.STRING,
        },
    })
