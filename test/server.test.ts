import createServer from '../src/server'

import typeorm = require('typeorm')

const token =
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic3dyIiwiaWF0IjoxNTY5NTc1NDE4fQ.mb8RC13LCk1p7ng0R_LrX5cam3lWxsXKKoWQ4TqUgBc'
const items = [
  { id: '96B00365-E5DD-E911-BCD0-000D3AB0FE6C', name: 'Item one' },
  { id: '97B00365-E5DD-E911-BCD0-000D3AB0FE6C', name: 'Item two' }
]

const dbMock = {
  Item: {
    save: jest.fn().mockReturnValue(items[0]),
    find: jest.fn().mockReturnValue(items),
    findOne: jest.fn().mockReturnValue(items[1]),
    remove: jest.fn()
  }
}

typeorm.getConnectionOptions = jest.fn().mockReturnValue({})
typeorm.createConnection = jest.fn().mockReturnValue({
  getRepository: model => dbMock[model.name]
})

describe('Server', () => {
  const server = createServer()
  afterAll(() => server.close())

  test('/health returns ok', done => {
    server.inject(
      {
        method: 'GET',
        url: '/health'
      },
      (err, res) => {
        expect(res.statusCode).toBe(200)
        expect(JSON.parse(res.payload)).toEqual({ status: 'ok' })
        done(err)
      }
    )
  })
  test('GET /items returns list of items', done => {
    server.inject(
      {
        method: 'GET',
        url: '/items',
        headers: {
          Authorization: `Bearer ${token}`
        }
      },
      (err, res) => {
        expect(res.statusCode).toBe(200)
        expect(dbMock.Item.find).toHaveBeenCalledWith()
        expect(JSON.parse(res.payload)[0]).toEqual(items[0])
        done(err)
      }
    )
  })
})
