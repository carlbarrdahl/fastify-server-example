import fp from "fastify-plugin"

// see also https://github.com/fastify/fastify-plugin

const schema = {
  type: 'object',
  required: ['SECRET',"OTPLABEL"],
  properties: {
    SECRET: {
      type: "string"
    },
    OTPLABEL: {
      type: "string"
    },
    SMTPFROM: {
      type: "string"
    },
    SMTPHOST: {
      type: "string"
    },
    SMTPPORT: {
      type: "number"
    },
    SMTPUSER: {
      type: "string"
    },
    SMTPPASS: {
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
        OTPLABEL: string,
        SECRET: string,
        SMTPHOST: string,
        SMTPUSER: string,
        SMTPPASS: string,
        SMTPPORT: number,
        SMTPFROM: string
      }
    }
  }

