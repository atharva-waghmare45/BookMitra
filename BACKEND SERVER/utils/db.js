// utils/db.js

const mysql = require('mysql2');

// Create MySQL connection pool
const pool = mysql.createPool({
    host: 'localhost',          // DB host
    user: 'root',               // DB username
    password: 'manager',               // DB password
    database: 'online_bookstore_final', // DB name       // Max connections
});

module.exports = pool;
