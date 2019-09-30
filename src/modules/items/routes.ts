import { listItemsSchema } from './schema'

export default (server, options, next) => {
  server.get(
    '/items',
    { schema: listItemsSchema, preValidation: [server.authenticate] },
    async (req, res) => {
      try {
        req.log.info(`list items from db`)
        const items = await server.db.items.find()
        res.send(items)
      } catch (error) {
        req.log.error(error)
        res.code(500).send({})
      }
    }
  )
  next()
}
