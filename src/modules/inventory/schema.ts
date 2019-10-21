import { productSchema } from '../products/schema'

const inventorySchema = {
  id: { type: 'string', format: 'uuid' },
  product_id: { type: 'string', format: 'uuid' },
  product: { type: 'object', properties: productSchema },
  quantity: { type: 'number', min: 1 },
  expiry_date: { type: 'string', format: 'date-time' },
  created_at: { type: 'string', format: 'date-time' },
  updated_at: { type: 'string', format: 'date-time' }
}

export const listInventorySchema = {
  summary: 'list inventory',
  description: 'list inventory',
  response: {
    200: {
      type: 'array',
      items: {
        properties: inventorySchema
      }
    }
  }
}

export const postInventorySchema = {
  summary: 'create inventory',
  description: 'create inventory',
  body: {
    type: 'object',
    required: ['product_id', 'quantity'],
    properties: {
      product_id: { type: 'string', format: 'uuid' },
      quantity: { type: 'integer', minimum: 1 }
    }
  },
  response: {
    201: {
      type: 'object',
      properties: inventorySchema
    }
  }
}
export const getInventorySchema = {
  summary: 'get inventory',
  description: 'get inventory',
  params: {
    type: 'object',
    required: ['id'],
    properties: {
      id: { type: 'string', format: 'uuid' }
    }
  },
  response: {
    200: {
      type: 'object',
      properties: inventorySchema
    }
  }
}

export const deleteInventorySchema = {
  summary: 'delete inventory',
  description: 'delete inventory',
  params: {
    type: 'object',
    required: ['id'],
    properties: {
      id: { type: 'string', format: 'uuid' }
    }
  },
  response: {
    200: {
      type: 'object'
    }
  }
}

export const printInventorySchema = {
  summary: 'print inventory label',
  description: 'print inventory label',
  params: {
    type: 'object',
    required: ['id'],
    properties: {
      id: { type: 'string', format: 'uuid' }
    }
  },
  response: {
    200: {
      type: 'object',
      properties: { status: { type: 'string' } }
    }
  }
}
