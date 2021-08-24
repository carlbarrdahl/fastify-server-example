import fastify from "fastify"

import auth from "./plugins/auth"
import db from "./plugins/db"
import env from "./plugins/env"
import healthHandler from "./modules/health/routes"
import productsHandler from "./modules/products/routes"
import inventoryHandler from "./modules/inventory/routes"
import loginHandler from "./modules/users/routes"

function createServer() {
  const server = fastify({ logger: { prettyPrint: true, level: 'info' } })

  server.register(env)
  server.after(() => {
    if (!server.config) {
      server.log.error("Invalid config")
      throw ("Invalid config")
    }
    //console.log("after",server.config)
    const msg = JSON.stringify(server.config)
    server.log.info(`Config: ${msg}`)
  })


  server.register(require('fastify-cors'), { 
    // put your options here
  })
  
  server.register(require("fastify-oas"), {
    routePrefix: "/docs",
    exposeRoute: true,
    swagger: {
      info: {
        title: "inventory api",
        description: "api documentation",
        version: "0.1.0"
      },
      servers: [
        { url: "http://localhost:3000", description: "development" },
        {
          url: "https://akugel.uber.space/fastify",  // testing
          description: "production"
        }
      ],
      schemes: ["http"],
      consumes: ["application/json"],
      produces: ["application/json"],
      security: [{ bearerAuth: [] }],
      securityDefinitions: {
        bearerAuth: {
          type: "http",
          scheme: "bearer",
          bearerFormat: "JWT"
        }
      }
    }
  })

  server.register(auth)
  server.register(db)
  server.register(healthHandler)
  server.register(productsHandler)
  server.register(inventoryHandler)
  server.register(loginHandler)

  server.setErrorHandler((error, req, res) => {
    req.log.error(error.toString())
    res.send({ error })
  })

  server.ready(() => {
  })

  return server
}

export default createServer
