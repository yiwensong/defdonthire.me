var webpack = require('webpack');  
module.exports = {  
    entry: [
        "./defdonthireme/static/js/app.js"
    ],
    output: {
        path: __dirname + '/defdonthireme/static',
        filename: "bundle.js"
    },
    module: {
        loaders: [
            {
                test: /\.js?$/,
                loader: 'babel-loader',
                query: {
                    presets: ['es2015', 'react']
                },
                exclude: /node_modules/
            }
        ]
    },
    plugins: [
    ]
};
