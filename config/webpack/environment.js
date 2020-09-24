const { environment } = require('@rails/webpacker')

// cocoon導入,追記ここから
const webpack = require('webpack')
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery'
    })
)
// cocoon導入,追記ここまで


module.exports = environment
