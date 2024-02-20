module.exports = function(api) {
  const presets = [
    [
      "@babel/preset-env",
      {
        targets: {
          node: "current"
        }
      }
    ],
    "@babel/preset-react"
    // Add more presets as needed
  ];

  const plugins = [
    // Add any additional Babel plugins here
    "@babel/plugin-syntax-dynamic-import",
  ];

  return {
    presets,
    plugins
  };
};
