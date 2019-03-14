const path = require("path"),
  webpack = require("webpack"),
  UglifyJsPlugin = require("uglifyjs-webpack-plugin"),
  MiniCssExtractPlugin = require("mini-css-extract-plugin"),
  OptimizeCSSAssetsPlugin = require("optimize-css-assets-webpack-plugin");

module.exports = {
  optimization: {
    minimizer: [
      new UglifyJsPlugin({
        cache: true,
        parallel: true,
        sourceMap: true // set to true if you want JS source maps
      }),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
  entry: "./public/js/main.js",
  output: {
    path: path.resolve(__dirname, "public/dist"),
    filename: "scripts.bundle.js"
    // publicPath: "/public/js" // if you would use webpack-dev-server */
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: "styles.bundle.css",
    }),
    new webpack.IgnorePlugin(/\.\/locale$/),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery"
    }),
  ],
  module: {
    rules: [{
        test: /\.css$/,
        use: [{
            loader: MiniCssExtractPlugin.loader,
          },
          "css-loader"
        ]
      },
      {
        test: /\.(png|jpg|gif)$/i,
        use: [{
          loader: 'url-loader'
        }]
      },
      {
        test: /\.m?js$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"]
          }
        }
      }
    ]
  }
};