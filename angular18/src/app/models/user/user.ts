export class User {
  id: number | null;
  username: string | null;
  email: string | null;
  token: string | null;
  firstName: string | null;
  lastName: string | null;
  designation: string | null;
  roles: string | null;
  constructor() {
    this.id = null;
    this.username = null;
    this.firstName = null;
    this.lastName = null;
    this.email = null;
    this.token = null;
    this.designation = null;
    this.roles = null;
  }
}
