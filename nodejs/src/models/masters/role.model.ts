import { Model, DataTypes, Optional, Sequelize, DATE } from "sequelize";
import { TypeAssertion } from "typescript";
import sequelizeInstance from "../../config/database";

// For stricter typechecking
interface RoleMasterAttributes {
  id: number;
  name: string;
  code: string;
  createdBy: number; //TODO: Foreign key with user id
  // createdAt: Date;
}

// id optional when calling RoleMaster.create() or RoleMaster.build()
interface RoleCreationAttributes extends Optional<RoleMasterAttributes, "id"> { }

// We need to declare an interface for our model that is basically what our class would be
interface RoleInstance
  extends Model<RoleMasterAttributes, RoleCreationAttributes>,
  RoleMasterAttributes { }

const Role = sequelizeInstance.define<RoleInstance>("Role", {
  id: {
    primaryKey: true,
    autoIncrement: true,
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  code: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  createdBy: {
    type: DataTypes.INTEGER.UNSIGNED,
    allowNull: false,
  },
  // createdAt: {
  //   type: DataTypes.DATE,
  //   allowNull: false,
  // }
}, {
  timestamps: false,
  tableName: "roles"
});

async function findById() {
  const instance = await Role.findByPk(1, {
    rejectOnEmpty: true,
  });
}

export default Role;
