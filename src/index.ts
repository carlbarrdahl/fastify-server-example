import createServer from './server'

const server = createServer()

const PORT = process.env.PORT || '3000'
server.listen(+PORT, '0.0.0.0', (err, address) => {
  if (err) throw err
  console.log(`server listening on ${address}`)
})
