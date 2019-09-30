import fastify from 'fastify'
import cors from 'cors'

import auth from './plugins/auth'
import db from './plugins/db'
import healthHandler from './modules/health/routes'
import itemsHandler from './modules/items/routes'

function createServer() {
  const server = fastify({ logger: true })
  server.use(cors())

  server.register(require('fastify-oas'), {
    routePrefix: '/docs',
    exposeRoute: true,
    swagger: {
      info: {
        title: 'api documentation',
        description: 'api documentation',
        version: '0.1.0'
      },
      host: 'localhost:3000',
      schemes: ['http'],
      consumes: ['application/json'],
      produces: ['application/json'],
      security: [{ bearerAuth: [] }],
      securityDefinitions: {
        bearerAuth: {
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT'
        }
      }
    }
  })

  server.register(auth)
  server.register(db)
  server.register(healthHandler)
  server.register(itemsHandler)

  /*
  generate temporary token to be used in app

  server.ready(() => {
    const token = server.jwt.sign({ user_id: 'user_id' })
    console.log(token)
  })
  */

  return server
}

export default createServer
