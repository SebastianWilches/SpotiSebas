const pg = require('pg');

//Configuración basica para generar la cadena de conexión
const pool = new pg.Pool({
    user: process.env.USERDB,
    host: process.env.HOSTDB,
    password: process.env.PASSWORDDB,
    database: process.env.DATABASE,
    port: process.env.PORTDB
})

module.exports = { pool };