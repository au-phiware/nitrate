express = require 'express'

app.configure ->
    cwd = process.cwd()
    
    app.set 'views', cwd + '/app/views'
    app.set 'view engine', 'coffee'
    app.set 'view options', complexNames: true
    app.register '.coffee', require('coffeekup').adapters.express
    app.enable 'coffee'

    app.use express.static(cwd + '/public', maxAge: 86400000)
    app.use express.bodyParser()
    app.use express.cookieParser 'secret'
    app.use express.session secret: 'secret'
    app.use express.methodOverride()
    app.use app.router

