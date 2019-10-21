export const productSchema = {
  id: { type: 'string', format: 'uuid' },
  name: { type: 'string' },
  image: { type: 'string', format: 'uri' },
  expires_in: {
    type: 'number',
    description: 'expiry time in days'
  },
  unit: { type: 'string' },
  created_at: { type: 'string', format: 'date-time' },
  updated_at: { type: 'string', format: 'date-time' }
}

export const listProductsSchema = {
  summary: 'products',
  description: 'products',
  response: {
    200: {
      type: 'array',
      items: {
        properties: productSchema
      }
    }
  }
}

export const deleteProductSchema = {
  summary: 'delete product',
  description: 'delete product',
  params: {
    type: 'object',
    required: ['id'],
    properties: {
      id: { type: 'string', format: 'uuid' }
    }
  },
  response: {
    200: {
      type: 'boolean'
    }
  }
}
