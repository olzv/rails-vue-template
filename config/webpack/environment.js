const path                = require('path')
const { environment }     = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue                 = require('./loaders/vue')

environment.config.merge({
    resolve: {
        alias: {
            '@node_modules': path.resolve(__dirname, '..', '..', 'node_modules'),
            '@':             path.resolve(__dirname, '..', '..', 'app/javascript'),
            '@pages':        path.resolve(__dirname, '..', '..', 'app/javascript/pages'),
            '@components':   path.resolve(__dirname, '..', '..', 'app/javascript/components'),
            '@models':       path.resolve(__dirname, '..', '..', 'app/javascript/models')
        }
    }
})

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
module.exports = environment
