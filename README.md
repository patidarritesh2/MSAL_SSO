# Azure AD Single Sign-On (SSO)
## Angular 18 (SPA) + Node.js 22 (REST API)

This repository contains a **complete, enterprise-ready Single Sign-On (SSO) implementation** using **Microsoft Entra ID (Azure Active Directory)**.

The solution enables secure authentication for an **Angular 18 frontend (SPA)** and authorization for a **Node.js 22 REST API** using industry-standard **OAuth 2.0** and **OpenID Connect** protocols.

---

## 📌 Features

- Azure AD based authentication
- Secure token-based authorization
- Protected Angular routes using MSAL Guard
- Secured Node.js APIs using Passport Bearer strategy
- Automatic token attachment via HTTP Interceptors
- Role & scope-based access control
- MFA & Conditional Access support (via Azure AD)

---

## 🧱 Technology Stack

### Frontend
- Angular 18
- `@azure/msal-angular`
- OAuth 2.0 / OpenID Connect
- MSAL Guard & MSAL Interceptor

### Backend
- Node.js 22.14
- Express.js
- Passport.js
- `passport-azure-ad` (Bearer Strategy)

### Identity Provider
- Microsoft Entra ID (Azure Active Directory)

---

## 🔄 Authentication Flow

1. User opens the Angular application
2. User is redirected to Azure AD login
3. Azure AD authenticates the user
4. Angular receives an access token
5. Token is attached to API requests
6. Node.js API validates the token
7. Protected data is returned securely

---

## 📁 Project Structure

```text

├── frontend
│   └── src
│       └── app
│           ├── auth
│           │   ├── sso.interceptor.ts
│           │   └── sso.guard.ts
│           ├── app.component.ts
│           ├── app.module.ts
│           └── app.routes.ts
│
├── backend
│   ├── config
│   │   └── azure.config.json
│   ├── middleware
│   │   └── sso.ts
│   ├── routes
│   │   └── protected.routes.ts
│   └── index.ts
│
└── README.md


```
---

## 🔐 Azure AD Configuration

### 1️⃣ Register Angular Application

- Azure Portal → **Microsoft Entra ID** → **App Registrations**
- Application type: **Single Tenant**
- Redirect URI:
http://localhost:4200

markdown
Copy code
- Enable:
- ✅ Access Tokens
- ✅ ID Tokens
- Grant **Admin Consent**

---

### 2️⃣ Register Node.js API

- Create a separate App Registration
- Navigate to **Expose an API**
- Set **Application ID URI**
- Create scope:
access_as_user


- Add Angular App as an **Authorized Client Application**

---

### 3️⃣ Optional Claims Configuration

Add the following claims under **Token Configuration**:

- `email`
- `name`
- `preferred_username`

Enable claims for:
- ID Token
- Access Token

---

## 🅰️ Angular Implementation

### Install Dependencies

npm install @azure/msal-angular msal
Key Concepts
PublicClientApplication for MSAL instance creation

MsalGuard for route protection

MsalInterceptor for automatic token injection

Redirect-based authentication

Tokens stored securely in browser cache

🟢 Node.js API Implementation
Install Dependencies
bash
Copy code
npm install passport passport-azure-ad
Authorization Strategy
Bearer token validation

Audience & issuer validation

Tenant-specific authentication

Middleware-based route protection

🔍 Sample Token Claims
Claim	Description
aud	API Audience
iss	Token Issuer
email	User Email
roles	User Roles
scp	Permission Scope
tid	Tenant ID
oid	User Object ID

🚀 Run the Application
Frontend
bash
Copy code
cd frontend
npm install
ng serve
Backend
bash
Copy code
cd backend
npm install
npm run dev
🔒 Security Best Practices
OAuth 2.0 + OpenID Connect

Azure AD MFA support

Token validation on every API request

Role & scope-based authorization

No credentials shared between frontend and backend

📌 Use Cases
Enterprise internal applications

Secure dashboards

HR & Finance systems

SaaS platforms

Corporate portals

👨‍💻 Author
Ritesh Patidar
Full Stack Developer (Angular | Node.js | Java)













