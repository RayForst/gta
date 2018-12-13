module.exports = {
  assetsDir: "admin/",
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
