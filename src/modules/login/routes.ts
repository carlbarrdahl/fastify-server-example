export default function loginHandler(server, options, next) {
  server.get(
    "/login",
    { 
      preHandler: [server.login] 
    },
    async (req, res) => {
      console.log("login")
    })

    next()
}

