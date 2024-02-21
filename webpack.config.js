module.exports = {
  // ... other webpack configuration options
  output: {
    // ... other output options

    // Set the hash function to 'sha512'
    hashFunction: 'xxhash64',
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
        },
      },
    ],
  },
};