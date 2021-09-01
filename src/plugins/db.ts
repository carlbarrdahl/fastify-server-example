import "reflect-metadata"
import fp from "fastify-plugin"
import { createConnection, getConnectionOptions } from "typeorm"
import { Inventory } from "../modules/inventory/entity"
import { Product } from "../modules/products/entity"
import { User } from "../modules/users/entity"

export default fp(async server => {
  try {
    const connectionOptions = await getConnectionOptions()
    Object.assign(connectionOptions, {
      options: { encrypt: true },
      entities: [Inventory, Product, User]
    })

    console.log(`connecting to database: ${connectionOptions.type}...`)
    const connection = await createConnection(connectionOptions)
    console.log("database connected")

    server.decorate("db", {
      inventory: connection.getRepository(Inventory),
      products: connection.getRepository(Product),
      users: connection.getRepository(User)
    })
  } catch (error) {
    console.log(error)
    console.log("make sure you have set .env variables - see .env.sample")
  }
})
