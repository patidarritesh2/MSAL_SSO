
const crypto = require('crypto');
const ENC_KEY = "8dS3fG5qWyZxLrBt";
const IV = "Ht9a3GxPzWQe";

/* sonar-ignore*/
export const JWT_SECRET = "9f4b0e3c6d2a5b9e7c3f1d6a0b9f3e8d7c4a2b6e198d47c1a8c7e2f4a1d3c5b9";
const encrypt = ((val: any) => {
  let cipher = crypto.createCipheriv('aes-128-gcm', ENC_KEY, IV, {
    padding: crypto.constants.PKCS7 // Explicitly specify PKCS7 padding for AES
  });
  let encrypted = cipher.update(val, 'utf8', 'base64');
  encrypted += cipher.final('base64');
  let authTag = cipher.getAuthTag();
  let maxLength = 1000;  // Set a safe length limit for JWTs
  if (encrypted.length > maxLength) {
    console.warn("JWT string is too large, truncating...");
    encrypted = encrypted.slice(0, maxLength);  // Truncate if too long
  }
  let authTagBase64 = authTag.toString('base64');
  let encryptedToken = `${encrypted}.${authTagBase64}`
    .replace(/\+/g, '-')    // Replace '+' with '-'
    .replace(/\//g, '_')    // Replace '/' with '_'
    .replace(/=+$/, '');

  return encryptedToken

});


const decrypt = ((encrypted: any) => {
  const replaceToken = encrypted
    .replace(/-/g, '+')
    .replace(/_/g, '/')
  let [encryptedToken, authTagBase64] = replaceToken.split('.');
  let authTag = Buffer.from(authTagBase64, 'base64');
  let decipher = crypto.createDecipheriv('aes-128-gcm', ENC_KEY, IV, {
    padding: crypto.constants.PKCS7 // Ensure PKCS7 padding is used in decryption
  });
  decipher.setAuthTag(authTag);
  let decrypted = decipher.update(encryptedToken, 'base64', 'utf8');
  return (decrypted + decipher.final('utf8'));
});

const cryptos = {
  encrypt,
  decrypt,
}

/* sonar-enable*/

export default cryptos;