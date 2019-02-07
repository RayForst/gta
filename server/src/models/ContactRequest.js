module.exports = (sequelize, DataTypes) =>
    sequelize.define('ContactRequest', {
        type: {
            type: DataTypes.STRING,
        },
        phone: {
            type: DataTypes.STRING,
        },
        fullname: {
            type: DataTypes.STRING,
        },
        email: {
            type: DataTypes.STRING,
        },
        message: {
            type: DataTypes.TEXT,
        },
        readed: {
            type: DataTypes.BOOLEAN,
            defaultValue: false
        }
    })
