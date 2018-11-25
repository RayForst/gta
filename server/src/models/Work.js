module.exports = (sequelize, DataTypes) =>
    sequelize.define('Work', {
        title: {
            type: DataTypes.STRING,
        },
        slug: {
            type: DataTypes.STRING,
            unique: true,
        },
        category: {
            type: DataTypes.STRING,
        },
    })
