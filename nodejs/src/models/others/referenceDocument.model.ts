import {
  Model,
  DataTypes,
  Optional,
  Sequelize
} from "sequelize";
import {
  TypeAssertion
} from "typescript";
import sequelizeInstance from "../../config/database";

// For stricter typechecking
interface ReferenceDocumentAttributes {
  id: number;
  docName: string;
  attachment: Buffer;
  attachmentName: string;
  visible: boolean;
  deleted: boolean;
  createdBy: number;
  createdAt: Date;
}

// id optional when calling UserModel.create() or UserModel.build()
interface ReferenceDocumentMasterAttributes extends Optional<ReferenceDocumentAttributes, "id"> { }

// We need to declare an interface for our model that is basically what our class would be
interface ReferenceDocumentInstance
  extends Model<ReferenceDocumentAttributes, ReferenceDocumentMasterAttributes>,
  ReferenceDocumentAttributes { }

const schema = sequelizeInstance.define<ReferenceDocumentInstance>("ReferenceDocument", {
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
  attachmentName: { // Added attachment name field
    type: DataTypes.STRING,
    allowNull: true,
  },
  visible: {
    type: DataTypes.BOOLEAN,
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
  tableName: "referencedocuments",
});



async function findById(id: string) {
  const ReferenceDocument = await schema.findByPk(id, {
    rejectOnEmpty: true,
  });
  return ReferenceDocument;
}

async function findAll() {
  const ReferenceDocument = await schema.findAll({
    where: {
      deleted: 0
    }
  });
  return ReferenceDocument
}

async function create(upsi: ReferenceDocumentAttributes) {
  return await schema.create(upsi);
}

async function findAndUpdate(id: number, upsi: ReferenceDocumentAttributes) {
  return await schema.update(upsi, {
    where: {
      id
    }
  });
}

const ReferenceDocuments = {
  schema,
  findById,
  findAll,
  create,
  findAndUpdate
};


export default ReferenceDocuments;
