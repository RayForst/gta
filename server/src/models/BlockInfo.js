module.exports = (sequelize, DataTypes) =>
    sequelize.define('BlockInfo', {
        title: {
            type: DataTypes.STRING,
        },
        caption: {
            type: DataTypes.STRING,
        },
        buttonText: {
            type: DataTypes.STRING,
        },
        page: {
            type: DataTypes.STRING,
            unique: true,
        },
    })
