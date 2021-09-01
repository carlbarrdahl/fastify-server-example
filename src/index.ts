import createServer from "./server"

const PORT = process.env.PORT || "3000"
const server = createServer()

//server.listen(+PORT, "0.0.0.0", (err, address) => {
server.listen(+PORT, "localhost", (err, address) => {
    if (err) throw err
  console.log(`server listening on ${address}`)
})
