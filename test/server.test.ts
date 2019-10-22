import createServer from "../src/server"
import typeorm = require("typeorm")

const token =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic3dyIiwiaWF0IjoxNTY5NTc1NDE4fQ.mb8RC13LCk1p7ng0R_LrX5cam3lWxsXKKoWQ4TqUgBc"
const products = [
  {
    id: "96B00365-E5DD-E911-BCD0-000D3AB0FE6C",
    expires_in: 1
  },
  {
    id: "97B00365-E5DD-E911-BCD0-000D3AB0FE6C",
    expires_in: 1
  }
]
const inventory = [
  {
    id: "98B00365-E5DD-E911-BCD0-000D3AB0FE6C",
    product: products[0],
    quantity: 1
  },
  {
    id: "99B00365-E5DD-E911-BCD0-000D3AB0FE6C",
    product: products[1],
    quantity: 2
  }
]

const dbMock = {
  Product: {
    find: jest.fn().mockReturnValue(products),
    findOne: jest.fn().mockReturnValue(products[1]),
    remove: jest.fn()
  },
  Inventory: {
    find: jest.fn().mockReturnValue(inventory),
    findOne: jest.fn().mockReturnValue(inventory[1]),
    save: jest.fn().mockReturnValue(inventory[0]),
    remove: jest.fn()
  }
}
typeorm.createConnection = jest.fn().mockReturnValue({
  getRepository: model => dbMock[model.name]
})

typeorm.getConnectionOptions = jest.fn().mockReturnValue({})

describe("Server", () => {
  const server = createServer()
  // server.decorate('db', dbMock)
  beforeEach(async () => {
    await server.ready()
  })
  afterAll(() => server.close())

  test("/health returns ok", done => {
    server.inject(
      {
        method: "GET",
        url: "/health"
      },
      (err, res) => {
        expect(res.statusCode).toBe(200)
        expect(JSON.parse(res.payload)).toEqual({ status: "ok" })
        done(err)
      }
    )
  })
  test("GET /products returns list of products", done => {
    server.inject(
      {
        method: "GET",
        url: "/products",
        headers: {
          Authorization: `Bearer ${token}`
        }
      },
      (err, res) => {
        expect(res.statusCode).toBe(200)
        expect(dbMock.Product.find).toHaveBeenCalledWith()
        expect(JSON.parse(res.payload)[0]).toEqual(products[0])
        done(err)
      }
    )
  })
  test("DELETE /products/:id deletes a product", done => {
    const { id } = products[1]
    server.inject(
      {
        method: "DELETE",
        url: `/products/${id}`,
        headers: {
          Authorization: `Bearer ${token}`
        }
      },
      (err, res) => {
        expect(res.statusCode).toBe(200)
        expect(dbMock.Product.findOne).toHaveBeenCalledWith(id)
        expect(dbMock.Product.remove).toHaveBeenCalledWith(products[1])
        done(err)
      }
    )
  })
  test("GET /inventory returns list of inventory", done => {
    server.inject(
      {
        method: "GET",
        url: "/inventory",
        headers: {
          Authorization: `Bearer ${token}`
        }
      },
      (err, res) => {
        expect(res.statusCode).toBe(200)
        expect(dbMock.Inventory.find).toHaveBeenCalledWith({
          relations: ["product"]
        })
        expect(JSON.parse(res.payload)[0]).toEqual(inventory[0])
        done(err)
      }
    )
  })
  test("POST /inventory/:id creates a product", done => {
    const body = {
      product_id: products[0].id,
      quantity: 1
    }
    server.inject(
      {
        method: "POST",
        url: `/inventory`,
        payload: body,
        headers: {
          Authorization: `Bearer ${token}`
        }
      },
      (err, res) => {
        expect(res.statusCode).toBe(201)
        expect(dbMock.Product.findOne).toHaveBeenCalledWith(body.product_id)
        expect(dbMock.Inventory.save).toHaveBeenCalled()
        expect(JSON.parse(res.payload)).toEqual(inventory[0])
        done(err)
      }
    )
  })
  test("DELETE /inventory/:id deletes an inventory", done => {
    const { id } = inventory[1]
    server.inject(
      {
        method: "DELETE",
        url: `/inventory/${id}`,
        headers: {
          Authorization: `Bearer ${token}`
        }
      },
      (err, res) => {
        expect(res.statusCode).toBe(200)
        expect(dbMock.Inventory.findOne).toHaveBeenCalledWith(id)
        expect(dbMock.Inventory.remove).toHaveBeenCalledWith(inventory[1])
        done(err)
      }
    )
  })
})
