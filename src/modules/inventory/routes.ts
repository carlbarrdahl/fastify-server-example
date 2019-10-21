import {
  getInventorySchema,
  postInventorySchema,
  listInventorySchema,
  deleteInventorySchema,
  printInventorySchema
} from "./schema"

export default function inventoryHandler(server, options, next) {
  server.get(
    "/inventory",
    { schema: listInventorySchema, preValidation: [server.authenticate] },
    async (req, res) => {
      const inventory = await server.db.inventory.find({
        relations: ["product"]
      })

      res.send(inventory)
    }
  )
  server.post(
    "/inventory",
    { schema: postInventorySchema, preValidation: [server.authenticate] },
    async (req, res) => {
      const { quantity, product_id } = req.body
      if (!product_id) {
        req.log.info(`product not found: ${product_id}`)
        return res.code(404).send("product not found")
      }

      req.log.info(`find product ${product_id} from db`)
      const product = await server.db.products.findOne(product_id)

      if (!product) {
        req.log.info(`product not found: ${product_id}`)
        return res.code(404).send("product not found")
      }

      req.log.info(`save inventory to db`)
      const inventory = await server.db.inventory.save({
        quantity,
        product,
        expiry_date: addDays(product.expires_in)
      })

      res.code(201).send(inventory)
    }
  )
  server.get(
    "/inventory/:id",
    { schema: getInventorySchema, preValidation: [server.authenticate] },
    async (req, res) => {
      req.log.info(`get inventory ${req.params.id} from db`)
      const inventory = await server.db.inventory.findOne(req.params.id)
      // if (req.user.user_id !== inventory.owner) {
      //   throw new Error("Unauthorized access")
      // }
      res.send(inventory)
    }
  )
  server.delete(
    "/inventory/:id",
    { schema: deleteInventorySchema, preValidation: [server.authenticate] },
    async (req, res) => {
      req.log.info(`get inventory ${req.params.id} for deletion`)
      const inventory = await server.db.inventory.findOne(req.params.id)
      req.log.info(`delete inventory: ${inventory.id}`)
      await server.db.inventory.remove(inventory)
      res.code(200).send({})
    }
  )
  server.post(
    "/inventory/:id/print",
    { schema: printInventorySchema, preValidation: [server.authenticate] },
    async (req, res) => {
      req.log.info(`print label for ${req.params.id}`)

      const inventory = await server.db.inventory.findOne(req.params.id)
      res.send({ status: "printing..." })
    }
  )
  next()
}

function addDays(days) {
  return new Date(Date.now() + 1000 * 3600 * days)
}
