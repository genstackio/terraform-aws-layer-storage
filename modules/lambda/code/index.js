module.exports = {
    handler: require('@ohoareau/aws-handlers').createS3eventHandler(require('./config')),
}