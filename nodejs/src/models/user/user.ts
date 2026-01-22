import { Model, DataTypes, Optional, Sequelize } from "sequelize";
import bcrypt from 'bcryptjs';
import sequelizeInstance from "../../config/database";
import Role from "../masters/role.model";
// For stricter typechecking
export interface UserAttributes {
	id: number;
	username: string;
	password: string;
	loginAttempts: number;
	locked: boolean;
	SessionToken: string;
}

// id optional when calling UserModel.create() or UserModel.build()
interface UserCreationAttributes extends Optional<UserAttributes, "id"> {
}

// We need to declare an interface for our model that is basically what our class would be
interface UserInstance extends Model<UserAttributes, UserCreationAttributes>,
	UserAttributes { }

const User = sequelizeInstance.define<UserInstance>("User", {
	id: {
		primaryKey: true,
		autoIncrement: true,
		type: DataTypes.INTEGER.UNSIGNED,
	},
	username: {
		type: DataTypes.STRING,
	},
	password: {
		type: DataTypes.STRING,
	},
	loginAttempts: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
	},
	locked: {
		type: DataTypes.BOOLEAN,
		defaultValue: false,
	},
	SessionToken: {
		type: DataTypes.STRING,
		allowNull: true,
	},

}, {
	timestamps: false,
	tableName: "users",
	hooks: {
		beforeValidate: async (user: UserInstance, options: any) => {
			if (user.password) {
				const hash = await bcrypt.hash(user.password, 10);
				user.password = hash;
			}
		},
	}
},);

User.belongsToMany(Role, { through: 'UserRoleMapping' });

export class UserModel implements UserAttributes {
	id: number
	username: string
	password: string
	token: string
	loginAttempts: number;
	locked: boolean;
	SessionToken: string;
	constructor(id: number, username: string, password: string, token: string, loginAttempts: number, locked: boolean, SessionToken: string) {
		this.id = id
		this.username = username
		this.password = password
		this.token = token
		this.loginAttempts = loginAttempts
		this.locked = locked
		this.SessionToken = SessionToken;

	}

}

export default User;
