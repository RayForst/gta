module.exports = (sequelize, DataTypes) =>
    sequelize.define('Head', {
        title: {
            type: DataTypes.STRING,
        },
        caption: {
            type: DataTypes.STRING,
            unique: true,
        },
        page: {
            type: DataTypes.STRING,
            unique: true,
        },
    })
