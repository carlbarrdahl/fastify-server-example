import 'reflect-metadata'
import fp from 'fastify-plugin'
import { createConnection, getConnectionOptions } from 'typeorm'
import { Item } from '../modules/items/entity'

export default fp(async server => {
  try {
    const connectionOptions = await getConnectionOptions()
    Object.assign(connectionOptions, {
      options: { encrypt: true },
      entities: [Item]
    })

    console.log(`connecting to database: ${connectionOptions.type}...`)
    const connection = await createConnection(connectionOptions)
    console.log('database connected')

    const items = connection.getRepository(Item)

    const db = { items }

    server.decorate('db', db)
  } catch (error) {
    console.log(error)
    console.log('make sure you have set .env variables - see .env.sample')
  }
})
