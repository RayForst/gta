export default {
    port: process.env.PORT || 8191,
    db: {
        database: process.env.DB_NAME || 'gta',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASS || '1234',
        options: {
            dialect: 'mysql',
            host: 'localhost',
        },
    },
}