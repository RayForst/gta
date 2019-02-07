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
        person_name: {
            type: DataTypes.STRING,
        },
        person_position: {
            type: DataTypes.STRING,
        },
        comment: DataTypes.TEXT,
        shortDescription: {
            type: DataTypes.TEXT,
        },
        description: {
            type: DataTypes.TEXT,
        },
        description2: {
            type: DataTypes.TEXT,
        },
        image: {
            type: DataTypes.STRING,
        }
    })
