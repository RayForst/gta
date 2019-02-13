const path = require('path');
module.exports = {
  baseUrl: '/admin/',
  lintOnSave: false,
  configureWebpack: {
    module: {
      rules: [
        {
          test: /\.pug$/,
          loader: "pug-plain-loader"
        }
      ]
    }
  }
};
