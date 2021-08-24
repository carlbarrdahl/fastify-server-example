export default function loginHandler(server, options, next) {
  server.get(
    "/login",
    { 
      preHandler: [server.login] 
    },
    async (req, res) => {
      req.log.info(`login complete`)
      res.send({"token":req.token})
    })

    next()
}

