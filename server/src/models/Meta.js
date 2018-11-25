module.exports = (sequelize, DataTypes) =>
    sequelize.define('Meta', {
        title: {
            type: DataTypes.STRING,
        },
        description: {
            type: DataTypes.STRING,
            unique: true,
        },
        keywords: DataTypes.STRING,
        page: {
            type: DataTypes.STRING,
            unique: true,
        },
    })
