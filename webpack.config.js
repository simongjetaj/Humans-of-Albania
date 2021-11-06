const path = require("path"),
  webpack = require("webpack"),
  TerserPlugin = require('terser-webpack-plugin'),
  MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
  optimization: {
    minimize: true,
    minimizer: [new TerserPlugin()],
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
    new webpack.IgnorePlugin({ resourceRegExp: /\.\/locale$/ }),
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
