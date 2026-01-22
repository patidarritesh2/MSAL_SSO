import { Model, DataTypes, Optional} from "sequelize";
import sequelizeInstance from "../../config/database";
import User from "./user";
// For stricter typechecking
export interface UserDetailAttributes {
  id: number;
  userId: number;
  firstName: string;
  middleName: string;
  lastName: string;
  secondaryEmail: string;
  dob: Date;
  email: string;
  nationality: string; // TODO Foreign Key
  category: number; // like Gender
  isDesignatedPerson: boolean;
  reasonForDeactivation: string;
  profilePicture: Buffer;
  designationId: number;
  departmentId: number;
  subDepartment:string;
  // profileType: string;
  // profileData: BlobDataType;
  status: boolean; // 0 - Active, 1 - Inactive, 2 - Deleted
  authenticationType: string; //NATIVE OR AD
  username?: string;
  createdBy: number;
  createdAt: Date;
  addedAt: Date // This is when manually added a record to the database
  modifiedBy: number;
  modifiedAt: Date;
  deactivatedAt: Date;
  loggedInAt: Date;
  loggedOutAt: Date;
  isDeleted: boolean;
  whetherFromRelatedCompany: string;
  insiderlensId: number;
  employeeId: number;
  city: string;
  PAN: string;
  nameAsPerPAN: string;
  landlineNo: number;
  mobileNo1: number,
  mobileNo2: number,
  position: number,
  idInfo: string,
  idNumber: number,
  attachment: string,
  effectiveFrom: Date,
  effectiveTo: Date,
  desigEffectiveFrom: Date,
  desigEffectiveTo: Date,
  deptEffectiveTo: Date,
  deptEffectiveFrom: Date,
  institution: string;
  qualification: string;
  passingYear: Date;
  empName: string;
  empDesignation: string;
  empMobileNo: number;
  empEmailId: string;
  empFromDate: Date;
  empToDate: Date;
  companyHas: number;
  assoComp: number;
  matSubComp: number;
  nonmatSubComp: number;
  jointventComp: number;
  holdComp: number;
  intimationMode: string;
  intimationModeUptil: Date;
  isCheckPolicy: boolean;
}

// id optional when calling UserDetailModel.create() or UserDetailModel.build()
interface UserDetailCreationAttributes extends Optional<UserDetailAttributes, "id"> {
  build(attributes: UserDetailAttributes): UserDetailAttributes;
}

// We need to declare an interface for our model that is basically what our class would be
interface UserDetailInstance extends Model<UserDetailAttributes, UserDetailCreationAttributes>,
  UserDetailAttributes {
  designation: string;
}

const UserDetail = sequelizeInstance.define<UserDetailInstance>("userdetails", {
  id: {
    primaryKey: true,
    autoIncrement: true,
    type: DataTypes.INTEGER.UNSIGNED,
  },
  userId: {
    type: DataTypes.INTEGER.UNSIGNED,
    references: {
      model: 'User',
      key: 'id'
    }
  },
  firstName: {
    type: DataTypes.STRING,
  },
  middleName: {
    type: DataTypes.STRING,
  },
  lastName: {
    type: DataTypes.STRING,
  },
  dob: {
    type: DataTypes.DATE,
  },
  email: {
    type: DataTypes.STRING,
  },
  nationality: {
    type: DataTypes.INTEGER.UNSIGNED,
  },
  category: {
    type: DataTypes.BOOLEAN,
  },
  isDesignatedPerson: {
    type: DataTypes.BOOLEAN,
  },
  secondaryEmail: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  profilePicture: {
    type: DataTypes.BLOB,
    allowNull: true,
  },
  designationId: {
    type: DataTypes.NUMBER,
    allowNull: true,
  },
  departmentId: {
    type: DataTypes.NUMBER,
    allowNull: true,
  },
   subDepartment: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  // profileType: {
  //   type: DataTypes.STRING
  // },
  // profileData: {
  //   type: DataTypes.BLOB("long")
  // },
  status: {
    type: DataTypes.NUMBER,
  },
  authenticationType: {
    type: DataTypes.STRING,
  },
  createdBy: {
    type: DataTypes.INTEGER,
  },
  createdAt: {
    type: DataTypes.DATE,
  },
  addedAt: {
    type: DataTypes.DATE,
  },
  modifiedBy: {
    type: DataTypes.INTEGER,
  },
  modifiedAt: {
    type: DataTypes.DATE,
  },
  deactivatedAt: {
    type: DataTypes.DATE,
    allowNull: true,
  },
  reasonForDeactivation: {
    type: DataTypes.STRING,
  },
  loggedInAt: {
    type: DataTypes.DATE,
    allowNull: true,
  },
  loggedOutAt: {
    type: DataTypes.DATE,
    allowNull: true,
  },
  isDeleted: {
    type: DataTypes.BOOLEAN,
  },
  whetherFromRelatedCompany: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  insiderlensId: {
    type: DataTypes.INTEGER,
  },
  employeeId: {
    type: DataTypes.INTEGER,
  },
  city: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  PAN: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  nameAsPerPAN: {
    type: DataTypes.STRING,
    allowNull: true
  },
  landlineNo: {
    type: DataTypes.NUMBER,
    allowNull: true,
  },
  mobileNo1: {
    type: DataTypes.NUMBER,
    allowNull: true,
  },
  mobileNo2: {
    type: DataTypes.NUMBER,
    allowNull: true,
  },
  position: {
    type: DataTypes.INTEGER,
  },
  idInfo: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  idNumber: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  attachment: {
    type: DataTypes.STRING,
    allowNull: true
  },
  effectiveFrom: {
    type: DataTypes.DATE,
  },
  effectiveTo: {
    type: DataTypes.DATE,
  },
  desigEffectiveFrom: {
    type: DataTypes.DATE,
  },
  desigEffectiveTo: {
    type: DataTypes.DATE,
  },
  deptEffectiveFrom: {
    type: DataTypes.DATE,
  },
  deptEffectiveTo: {
    type: DataTypes.DATE,
  },
  institution: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  qualification: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  passingYear: {
    type: DataTypes.DATE,
  },
  empName: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  empDesignation: {
    type: DataTypes.STRING,
    allowNull: true,
  },
  empMobileNo: {
    type: DataTypes.NUMBER,
    allowNull: true,
  },
  empEmailId: {
    type: DataTypes.STRING,
  },
  empFromDate: {
    type: DataTypes.DATE,
  },
  empToDate: {
    type: DataTypes.DATE,
  },
  companyHas: {
    type: DataTypes.NUMBER,
  },
  assoComp: {
    type: DataTypes.NUMBER,
  },
  matSubComp: {
    type: DataTypes.NUMBER,
  },
  nonmatSubComp: {
    type: DataTypes.NUMBER,
  },
  jointventComp: {
    type: DataTypes.NUMBER,
  },
  holdComp: {
    type: DataTypes.NUMBER,
  },
  intimationMode: {
    type: DataTypes.ENUM,
    values: ['addition', 'deduction'],
    allowNull: true
  },
  intimationModeUptil: {
    type: DataTypes.DATE,
  },
  isCheckPolicy:{
    type: DataTypes.BOOLEAN,
    defaultValue: false
  }

}, {
  timestamps: false,
  tableName: "userdetails"
});

User.hasOne(UserDetail, {
  //sourceKey: 'id',
  foreignKey: 'userId',
  onDelete: 'CASCADE',
  onUpdate: 'CASCADE',
})
UserDetail.belongsTo(User, {
  as: 'User',
  foreignKey: 'userId',
  targetKey: 'id',
  onUpdate: 'CASCADE',
  onDelete: 'CASCADE'
});
export class UserDetailModel implements UserDetailAttributes {
  id: number
  userId: number
  firstName: string;
  middleName: string;
  lastName: string;
  secondaryEmail: string;
  dob: Date;
  email: string;
  nationality: string;
  category: number;
  isDesignatedPerson: boolean;
  reasonForDeactivation: string;
  profilePicture: Buffer;
  designationId: number;
  departmentId: number;
  subDepartment:string;
  status: boolean;
  authenticationType: string;
  username: string;
  createdBy: number;
  createdAt: Date;
  addedAt: Date;
  modifiedBy: number;
  modifiedAt: Date;
  deactivatedAt: Date;
  loggedInAt: Date;
  loggedOutAt: Date;
  isDeleted: boolean;
  whetherFromRelatedCompany: string;
  insiderlensId: number;
  employeeId: number;
  city: string;
  PAN: string;
  nameAsPerPAN: string;
  landlineNo: number;
  mobileNo1: number;
  mobileNo2: number;
  position: number;
  idInfo: string;
  idNumber: number;
  attachment: string;
  effectiveFrom: Date;
  effectiveTo: Date;
  desigEffectiveFrom: Date;
  desigEffectiveTo: Date;
  deptEffectiveTo: Date;
  deptEffectiveFrom: Date;
  institution: string;
  qualification: string;
  passingYear: Date;
  empName: string;
  empDesignation: string;
  empMobileNo: number;
  empEmailId: string;
  empFromDate: Date;
  empToDate: Date;
  companyHas: number;
  assoComp: number;
  matSubComp: number;
  nonmatSubComp: number;
  jointventComp: number;
  holdComp: number;
  intimationMode: string;
  intimationModeUptil: Date;
  isCheckPolicy: boolean;

  constructor(id: number,
    userId: number,
    firstName: string,
    middleName: string,
    lastName: string,
    secondaryEmail: string,
    dob: Date,
    email: string,
    nationality: string,
    category: number,
    isDesignatedPerson: boolean,
    reasonForDeactivation: string,
    profilePicture: Buffer,
    designationId: number,
    departmentId: number,
    subDepartment:string,
    status: boolean,
    authenticationType: string,
    username: string,
    createdBy: number,
    createdAt: Date,
    addedAt: Date,
    modifiedBy: number,
    modifiedAt: Date,
    deactivatedAt: Date,
    loggedInAt: Date,
    loggedOutAt: Date,
    isDeleted: boolean,
    whetherFromRelatedCompany: string,
    insiderlensId: number,
    employeeId: number,
    city: string,
    PAN: string,
    nameAsPerPAN: string,
    landlineNo: number,
    mobileNo1: number,
    mobileNo2: number,
    position: number,
    idInfo: string,
    idNumber: number,
    attachment: string,
    effectiveFrom: Date,
    effectiveTo: Date,
    desigEffectiveFrom: Date,
    desigEffectiveTo: Date,
    deptEffectiveTo: Date,
    deptEffectiveFrom: Date,
    institution: string,
    qualification: string,
    passingYear: Date,
    empName: string,
    empDesignation: string,
    empMobileNo: number,
    empEmailId: string,
    empFromDate: Date,
    empToDate: Date,
    companyHas: number,
    assoComp: number,
    matSubComp: number,
    nonmatSubComp: number,
    jointventComp: number,
    holdComp: number,
    intimationMode: string,
    intimationModeUptil: Date,
  ) {
    this.id = id,
      this.userId = userId,
      this.firstName = firstName,
      this.middleName = middleName,
      this.lastName = lastName,
      this.secondaryEmail = secondaryEmail,
      this.dob = dob,
      this.email = email,
      this.nationality = nationality,
      this.category = category,
      this.isDesignatedPerson = isDesignatedPerson,
      this.reasonForDeactivation = reasonForDeactivation,
      this.profilePicture = profilePicture,
      this.designationId = designationId,
      this.departmentId = departmentId,
      this.subDepartment =subDepartment,
      this.status = status,
      this.authenticationType = authenticationType,
      this.username = username,
      this.createdBy = createdBy,
      this.createdAt = createdAt,
      this.addedAt = addedAt,
      this.modifiedBy = modifiedBy,
      this.modifiedAt = modifiedAt,
      this.deactivatedAt = deactivatedAt,
      this.loggedInAt = loggedInAt,
      this.loggedOutAt = loggedOutAt,
      this.isDeleted = isDeleted,
      this.whetherFromRelatedCompany = whetherFromRelatedCompany,
      this.insiderlensId = insiderlensId,
      this.employeeId = employeeId,
      this.city = city,
      this.PAN = PAN,
      this.nameAsPerPAN = nameAsPerPAN,
      this.landlineNo = landlineNo,
      this.mobileNo1 = mobileNo1,
      this.mobileNo2 = mobileNo2,
      this.position = position,
      this.idInfo = idInfo,
      this.idNumber = idNumber,
      this.attachment = attachment
    this.effectiveFrom = effectiveFrom,
      this.effectiveTo = effectiveTo,
      this.desigEffectiveFrom = desigEffectiveFrom,
      this.desigEffectiveTo = desigEffectiveTo,
      this.deptEffectiveTo = deptEffectiveTo,
      this.deptEffectiveFrom = deptEffectiveFrom,
      this.institution = institution,
      this.qualification = qualification,
      this.passingYear = passingYear,
      this.empName = empName,
      this.empDesignation = empDesignation,
      this.empMobileNo = empMobileNo,
      this.empEmailId = empEmailId,
      this.empFromDate = empFromDate,
      this.empToDate = empToDate,
      this.companyHas = companyHas,
      this.assoComp = assoComp,
      this.matSubComp = matSubComp,
      this.nonmatSubComp = nonmatSubComp,
      this.jointventComp = jointventComp,
      this.holdComp = holdComp,
      this.intimationMode = intimationMode,
      this.intimationModeUptil = intimationModeUptil
  }
}
export default UserDetail;
