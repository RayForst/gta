module.exports = (sequelize, DataTypes) =>
    sequelize.define('AboutCompany', {
        text: {
            type: DataTypes.TEXT,
        },
    })
