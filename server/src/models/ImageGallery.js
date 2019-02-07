module.exports = (sequelize, DataTypes) =>
    sequelize.define('ImageGallery', {
        keyword: {
            type: DataTypes.STRING,
        },
        images: {
            type: DataTypes.TEXT,
        },
    })
