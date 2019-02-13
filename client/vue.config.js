const path = require('path');
module.exports = {
  lintOnSave: false,
  devServer: {
    port: 7090
  },
  configureWebpack: {
    resolve: {
      alias: {
        'uploads': path.join(__dirname, '../uploads')
      }
    }
  }
};
