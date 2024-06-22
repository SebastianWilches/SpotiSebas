const pg = require('pg');

//Configuración basica para generar la cadena de conexión
const pool = new pg.Pool({
    user: 'postgres',
    host: 'localhost',
    password: '123456',
    database: 'TbtbGlobal',
    port: '5432'
})

module.exports = { pool };