export default function loginHandler(server, options, next) {
  server.get(
    "/login",
    { 
      preHandler: [server.login] 
    },
    async (req, res) => {
      req.log.info(`XX: login ${req.user}`)
      res.send({"token":req.token})
    })

    next()
}

