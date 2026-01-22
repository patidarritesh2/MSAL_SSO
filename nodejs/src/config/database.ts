import { DB_USER_NAME, DB_NAME, DB_PASSWORD, DB_DIALECT } from "./secret";
import { DB_HOST, DB_PORT } from ".";
import { Sequelize } from "sequelize";
let sequelizeInstance: Sequelize;

export let sequelizeInstance2: Sequelize;
if (DB_DIALECT === "mssql") {
  const tedious = require('tedious'); 
  sequelizeInstance = new Sequelize(DB_NAME, DB_USER_NAME, DB_PASSWORD, {
    host: DB_HOST,
    dialect: 'mssql',
    port: DB_PORT || 1433,
    dialectModule: tedious,
    dialectOptions: {
      options: {
        encrypt: true,
        trustServerCertificate: true,
         requestTimeout: 60000
      }
    },
    pool: {
      max: 200,
      min: 0,
      idle: 100000
    },
    logging: console.log
  });

  sequelizeInstance2 = new Sequelize(DB_NAME, DB_USER_NAME, DB_PASSWORD, {
  host:DB_HOST,
  dialect: DB_DIALECT,
  dialectModule: require('tedious'),
  pool: {
    max: 200,
    min: 0,
    acquire: 120000,
    idle: 100000,
  },
  port: DB_PORT,
  dialectOptions: {
    options: {
      encrypt: true,
      trustServerCertificate: true, 
       requestTimeout: 60000
    }
  },
  logging:console.log
});
} else if (DB_DIALECT === 'mysql') {
  sequelizeInstance = new Sequelize(DB_NAME, DB_USER_NAME, DB_PASSWORD, {
    host: DB_HOST,
  dialect: "mysql",
  pool: {
    max: 200,
    min: 0,
    acquire: 120000,
    idle: 10000,
  },
  port: DB_PORT,
  logging: console.log,
});
   sequelizeInstance2 = new Sequelize(DB_NAME, DB_USER_NAME, DB_PASSWORD, {
    host: DB_HOST,
  dialect: "mysql",
  pool: {
    max: 200,
    min: 0,
    acquire: 120000,
    idle: 10000,
  },
  port: DB_PORT,
  logging: console.log,
  
  });
} else {
  throw new Error(`Unsupported DB_DIALECT: ${DB_DIALECT}`);
}



export default sequelizeInstance;
