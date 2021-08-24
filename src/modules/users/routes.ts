import { registerUserSchema, loginUserSchema, userSchema } from "./schema"

// insert into user (name,email,pass) values ("user2","user2@x.y","abcd"); 

export default function loginHandler(server, options, next) {
  server.get(
    "/login",
    { },
    async (req, res) => {
      const auth = req.headers.authorization
      try {
        if (auth == undefined)
          throw("No credentials")
        const credentials = Buffer.from(auth.split(" ")[1],"base64").toString("utf-8")
        const authData = credentials.split(":")
        //console.log(authData)
        // user id should be derived from database check
        // const tok = await res.jwtSign({ user_id: credentials.split(":")[0] })
        const user = await server.db.users.findOne({ email: authData[0], pass: authData[1] })
        //console.log(JSON.stringify(user))
        if (!user) throw ("Not authorized")
        const tok = await res.jwtSign({ 
          user_id: user.id ,
          audience:"client", issuer: "fastify"
          },
          {expiresIn:3600}
        )
        if (!tok) throw("not authorized")
        req.log.info(`Login: ${user.id}, ${tok}`)
        res.send({"token":tok})
      } catch (err) {
        res.code(500).send({"error":err})
      }

    })

    next()
}


