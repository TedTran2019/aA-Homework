const path = require('path');

module.exports = {
	entry: './src/entry.jsx',
	output: {
		filename: 'bundle.js',
		path: path.resolve(__dirname, 'dist'),
	},
	module: {
		rules: [
			{
				test: [/\.jsx?$/],
				exclude: /(node_modules)/,
				use: {
					loader: 'babel-loader',
					query: {
						presets: ['@babel/env', '@babel/react']
					}
				},
			}
		]
	},
	devtool: 'source-map',
	resolve: {
		extensions: ['.js', '.jsx', '*']
	}
};
