import { registerUserSchema, loginUserSchema, userSchema } from "./schema"

import { httpCodes } from "../../httpCodes"

// insert into user (name,email,pass) values ("user2","user2@x.y","abcd"); 

export default function loginHandler(server, options, next) {
  server.get(
    "/login",
    { },
    async (req, res) => {
      const auth = req.headers.authorization
      try {
        if (auth == undefined)
          throw(httpCodes.BAD) //"No credentials")
        const credentials = Buffer.from(auth.split(" ")[1],"base64").toString("utf-8")
        const authData = credentials.split(":")
        //console.log(authData)
        // test password hashing
        //const hash = await server.bcrypt.hash(authData[1])
        //console.log("P ",authData[1], ", H: ",hash)

        //const user = await server.db.users.findOne({ email: authData[0], pass: authData[1] })
        // using hashed passwords! identify user by email
        const user = await server.db.users.findOne({ email: authData[0]})
        if (!user) throw (httpCodes.AUTH)
        const match = await server.bcrypt.compare(authData[1],user.pass)
        if (!match) throw (httpCodes.AUTH)
        //console.log(JSON.stringify(user))
        const tok = await res.jwtSign({ 
          user_id: user.id ,
          audience:"client", issuer: "fastify"
          },
          {expiresIn:3600}
        )
        if (!tok) throw(httpCodes.AUTH)
        req.log.info(`Login: ${user.id}, ${tok}`)
        // additional creeate totp id
        const otpOpts = {
          length: 32,
          label: "Fastify Server Test",
          step : 60,
          secret !: "string"
        }
        const otpId = server.totp.generateSecret(otpOpts.length) 
        otpOpts.secret = otpId.ascii
        const otpQr = await server.totp.generateQRCode(otpOpts)
        const otpUrl = server.totp.generateAuthURL(otpOpts)
        res.send({"token":tok, "url":otpUrl, "qr":otpQr})
      } catch (err: any) {
        if (err.code)
            res.code(err.code).send({"error":err.msg})
        else
            res.code(500).send({"error":err})
      }

    })

    next()
}


