import fp from "fastify-plugin"

// see also https://github.com/fastify/fastify-plugin

const schema = {
  type: 'object',
  //required: ['KEY1', 'KEY2'],
  properties: {
    KEY1: {
      type: 'string'
    },
    KEY2: {
      type: 'number'
    },
    SECRET: {
      type: "string"
    }
  }
}
const options = {
  confKey: 'config', // optional, default: 'config'
  schema: schema,
  dotenv: true // read .env
}


export default fp((server, opts, next) => {
    server.register(require("fastify-env"), options)
  next()
})

// needed to make config available in typescript
declare module 'fastify' {
    interface FastifyInstance //<any>
    {
      // this should be same as the confKey in options
      config: 
        //env.properties
      { 
        KEY1: string,
        KEY2: number
      };
    }
  }

