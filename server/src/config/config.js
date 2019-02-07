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
    smtp: {
        clientId: '211057929072-k6n17krph470kba2nir4gkju2vqthgoj.apps.googleusercontent.com',
        clientSecret: 'iPyBsu9fSvZyZvwlPwjHQHm0',
        refreshToken: '1/tKkCtatlZmamvn6ai7KPNhHXGQW3mPxPieR8SUDzwOA'
    }
}
