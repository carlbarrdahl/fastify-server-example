export const itemSchema = {
  id: { type: 'string', format: 'uuid' },
  name: { type: 'string' },
  created_at: { type: 'string', format: 'date-time' },
  updated_at: { type: 'string', format: 'date-time' }
}

export const listItemsSchema = {
  summary: 'items',
  description: 'items',
  response: {
    200: {
      type: 'array',
      items: {
        properties: itemSchema
      }
    }
  }
}
