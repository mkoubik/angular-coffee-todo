express = require 'express'
routes = require './routes'
http = require 'http'
path = require 'path'
consolidate = require 'consolidate'
assets = require 'connect-assets'

app = express()

app.configure ->
	app.set 'port', process.env.PORT || 3000
	app.set 'views', __dirname + '/views'
	app.set 'view engine', 'html'
	app.engine 'html', consolidate.eco
	app.use assets()
	app.use express.favicon()
	app.use express.logger('dev')
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use app.router
	app.use express.static(path.join(__dirname, 'public'))

app.configure 'development', ->
	app.use express.errorHandler()

app.get '/', routes.index

http.createServer(app).listen app.get('port'), ->
	console.log "Express server listening on port #{app.get('port')}"
