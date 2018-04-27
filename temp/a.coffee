require('dotenv').config()
if process?.env?.WITHSSL?
  urlConf = 
    withSSL: process.env.WITHSSL
    host: process.env.HOST
    port: process.env.PORT
  console.log urlConf
else
  urlConf =
    withSSL: false    # 可不写默认就为 false
    host: 'localhost' # 可不写默认就为 localhost
    port: '7001'

module.exports = urlConf