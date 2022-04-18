const mysql = require('mysql')
const app = require('./app')
const dotenv = require('dotenv').config()

let connectdb = mysql.createConnection({
  host: 'localhost',
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  port: 3306,
})

connectdb.connect(function (err) {
  if (err) {
    console.error('error connecting : ' + err.stack)
    return
  }
  console.log('Connected as Id!' + connectdb.threadId)
})

module.exports = connectdb
