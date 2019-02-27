export default {
    port: process.env.PORT || 8191,
    db: {
        database: process.env.DB_NAME || 'gta',
        user: process.env.DB_USER || 'root',
        password: process.env.DB_PASS || '1234',
        options: {
            dialect: 'mysql',
            host: 'localhost',
            insecureAuth: true,
        },
    },
    authentication: {
        jwtSecret: process.env.JWT_SECRET || 'secret',
    },
    admin: {
        name: 'Admin',
        login: 'gtaadmin',
        password: '1234',
    },
    smtpToken: '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'
}
