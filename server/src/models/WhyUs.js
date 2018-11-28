module.exports = (sequelize, DataTypes) =>
    sequelize.define('WhyUs', {
        text: {
            type: DataTypes.STRING,
        },
        icon: {
            type: DataTypes.STRING,
        },
    })
