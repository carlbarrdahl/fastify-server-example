import { getHealthSchema } from "./schema"

export default function healthHandler(server, options, next) {
  server.get("/health", { schema: getHealthSchema }, (req, res) => {
    res.send({ status: "ok" })
  })

  next()
}
