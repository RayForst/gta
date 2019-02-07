module.exports = (sequelize, DataTypes) =>
    sequelize.define('Team', {
        fullname: {
            type: DataTypes.STRING,
        },
        position: {
            type: DataTypes.STRING,
        },
        image: {
            type: DataTypes.STRING,
        }
    })
