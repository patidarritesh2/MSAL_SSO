
import Role from "../models/masters/role.model";
import { ROLE } from "../common/costants";


const isCO = async (roleId: number) => {
  const role = await Role.findOne({ where: { name: ROLE.CO }, raw: true });
  if (role && role.id == roleId)
    return true
};
const UserService = {
  isCO,
};

export default UserService;
