module.exports = {
  // ... other webpack configuration options
  node: {
    __dirname: false,  // or true if you need it
    __filename: false, // or true if you need it
    global: true,
  },
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