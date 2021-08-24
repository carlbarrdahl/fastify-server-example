import fp from "fastify-plugin"

const jwt = require('fastify-jwt')

// jwt options see https://github.com/auth0/node-jsonwebtoken#jwtsignpayload-secretorprivatekey-options-callback
/*
examples
expiresIn: expressed in seconds or a string describing a time span vercel/ms.

    Eg: 60, "2 days", "10h", "7d". A numeric value is interpreted as a seconds count. If you use a string be sure you provide the time units (days, hours, etc), otherwise milliseconds unit is used by default ("120" is equal to "120ms").

notBefore: expressed in seconds or a string describing a time span vercel/ms.

    Eg: 60, "2 days", "10h", "7d". A numeric value is interpreted as a seconds count. If you use a string be sure you provide the time units (days, hours, etc), otherwise milliseconds unit is used by default ("120" is equal to "120ms").

*/

export default fp((server, opts, next) => {
  // check secret in config
  if (!server.config.SECRET) throw ("Secret missing!")
  server.register(jwt, {
    secret: server.config.SECRET
  })
  server.decorate("authenticate", async (req, res) => {
    //console.log("Auth:", req,res)
    try {
      /*
      const auth = req.headers.authorization
      if (auth == undefined)
        throw("No credentials")
      const credentials = Buffer.from(auth.split(" ")[1],"base64").toString("utf-8")
      console.log("Auth:",credentials.split(":"))
      const token = credentials.split(":")[1]
      */
     // must call like this:
     //http -v localhost:3000/products  Authorization:"Bearer eyJ.. token .." 
     // authoization goes into header
      await req.jwtVerify()
    } catch (err) {
      res.send(err)
    }
  })

  server.decorate("login", async (req, res) => {
    //console.log("Login:", req,res)
    try {
      /* call like this
      http -v localhost:3000/login -a user:123
      */
      //console.log("Req:",req.headers)
      const auth = req.headers.authorization
      if (auth == undefined)
        throw("No credentials")
      const credentials = Buffer.from(auth.split(" ")[1],"base64").toString("utf-8")
      const authData = credentials.split(":")
      // user id should be derived from database check
      // const tok = await res.jwtSign({ user_id: credentials.split(":")[0] })
      //if (authData[0] == "user") throw ("fake")
      const uid = 42 // get from database else thow "not authorized" 
      /* payload options are
        * `audience`
        * `issuer`
        * `jwtid`
        * `subject`
        * `noTimestamp`
        * `header`
        * `keyid`
      */
      const tok = await res.jwtSign({ user_id: uid ,
        audience:"fastify", issuer: "server"
      },
        {expiresIn:3600})
      if (!tok) throw("not authorized")
      req.uid = uid
      req.token = tok
      req.log.info(`Login: ${req.uid}, ${req.token}`)
      //res.send(tok)
    } catch (err) {
      req.log.warn(`Login error: ${err}`)
      res.code(500).send({"error":err})
    }
  })

  
  next()
})
