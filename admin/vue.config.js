module.exports = {
  baseUrl: process.env.NODE_ENV === 'prod'
    ? '/admin/'
    : '/'
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
