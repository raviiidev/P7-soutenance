const express = require('express')
const app = express()
const xss = require('xss-clean') //nettoie toutes les données dans les requêtes
const helmet = require('helmet') //sécuriser les en-têtes HTTP contre empêcher les attaques telles que Cross-Site-Scripting
const bodyParser = require('body-parser')
const path = require('path')
const cors = require('cors') //partage des ressources entre différents serveurs
const dotenv = require('dotenv').config

const routesPosts = require('./routes/routesPosts')
const routesUsers = require('./routes/routesUsers')
const routesMod = require('./routes/routesMod')

app.use(xss())
app.use(helmet())
app.use(bodyParser.json())

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*')
  res.setHeader(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization',
  )
  res.setHeader(
    'Access-Control-Allow-Methods',
    'GET, POST, PUT, DELETE, PATCH, OPTIONS',
  )
  res.setHeader('Cross-Origin-Resource-Policy', 'cross-origin')
  next()
})

app.use('/images', express.static(path.join(__dirname, 'images')))
app.use('/api/posts', routesPosts)
app.use('/api/auth', routesUsers)
app.use('/api/moderation', routesMod)

module.exports = app
