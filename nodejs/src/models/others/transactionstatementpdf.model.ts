import {
  Model,
  DataTypes,
  Optional
} from "sequelize";
import sequelizeInstance from "../../config/database";

// For stricter typechecking transactionstatementpdf.model
interface TransactionStatementPdfAttributes {
  id: number;
  docName: string;
  attachment: Buffer;
  deleted: boolean;
  createdBy: number;
  createdAt: Date;
}

// id optional when calling UserModel.create() or UserModel.build()
interface TransactionStatementPdfMasterAttributes extends Optional<TransactionStatementPdfAttributes, "id"> { }

// We need to declare an interface for our model that is basically what our class would be
interface TransactionStatementPdfInstance
  extends Model<TransactionStatementPdfAttributes, TransactionStatementPdfMasterAttributes>,
  TransactionStatementPdfAttributes { }

const schema = sequelizeInstance.define<TransactionStatementPdfInstance>("TransactionStatementPdf", {
  id: {
    primaryKey: true,
    autoIncrement: true,
    type: DataTypes.INTEGER.UNSIGNED,
  },
  docName: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  attachment: {
    type: DataTypes.BLOB('long'), // Changed to BLOB for binary data
    allowNull: true,
  },
  deleted: {
    type: DataTypes.BOOLEAN,
    allowNull: true,
  },
  createdBy: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: true,
    references: {
      model: "User",
      key: "id",
    },
  },
  createdAt: {
    type: DataTypes.DATE,
    allowNull: true,
  }
}, {
  timestamps: false,
  tableName: "transactionstatementpdf",
});



async function findById(id: string) {
  const TransactionStatementPdf = await schema.findByPk(id, {
    rejectOnEmpty: true,
  });
  return TransactionStatementPdf;
}

async function findAndUpdate(id: number, tspa: TransactionStatementPdfAttributes) {
  return await schema.update(tspa, { where: { id } });
}

async function findAll(isCO: boolean, id: number) {
  const whereClause: Record<string, any> = {
    deleted: 0
  };

  if (!isCO) {
    whereClause.createdBy = id;
  }
  const TransactionStatementPdf = await schema.findAll({
    where: whereClause
  });
  return TransactionStatementPdf
}

async function create(tspa: TransactionStatementPdfAttributes) {
  return await schema.create(tspa);
}

const TransactionStatementPdfs = {
  schema,
  findById,
  findAndUpdate,
  findAll,
  create
};


export default TransactionStatementPdfs;
