import { listProductsSchema, deleteProductSchema } from "./schema"

export default (server, options, next) => {
  server.get(
    "/products",
    { schema: listProductsSchema, preValidation: [server.authenticate] },
    async (req, res) => {
      req.log.info(`list products from db`)
      /*
      console.log("----")

      console.log(server.db)
      console.log("----")
      */
      const products = await server.db.products.find()
      res.send(products)
    }
  )

  server.post(
    "/products",
    { schema: listProductsSchema, preValidation: [server.authenticate] },
    async (req, res) => {
      const { name, image, expires_in, unit } = req.body
      if (!name || !image || !expires_in || !unit) {
        req.log.info(`product specs required!`)
        return res.code(404).send("product specs required!")
      }

      req.log.info(`insert product ${name} `)
      const product = await server.db.products.save({
        name,
        image,
        expires_in,
        unit
      })

      res.code(201).send(product)
    }
  )


  server.delete(
    "/products/:id",
    { schema: deleteProductSchema, preValidation: [server.authenticate] },
    async (req, res) => {
      req.log.info(`delete product ${req.params.id} from db`)
      const product = await server.db.products.findOne(req.params.id)
      await server.db.products.remove(product)
      res.code(200).send({})
    }
  )
  next()
}
