import AdmZip from 'adm-zip';
import mime from 'mime';
import path from 'path';

function validateFilename(fileName: string): boolean {
    const forbiddenChars = /[<>?"%$^&*@#!~]/;
    return !forbiddenChars.test(fileName); // returns false if forbidden chars are found
}

// Function to check magic number for images (JPG, PNG)
function checkImageMagicNumber(buffer: Buffer, fileName: string): Promise<boolean> {
    return new Promise((resolve, reject) => {
        if (!validateFilename(fileName)) {
            return reject(new Error('Filename contains forbidden characters'));
        }
        const dotCount = (fileName.match(/\./g) || []).length;
        const isSingleExtension = dotCount === 1;
        if (!isSingleExtension) {
            return reject(new Error('Filename contains multiple extensions'));
        }
        const ext = path.extname(fileName).toLowerCase();
        if (ext !== '.jpg' && ext !== '.jpeg' && ext !== '.png') {
            return reject(new Error('Invalid image file extension'));
        }
        const mimeType = mime.lookup(fileName);
        if (mimeType !== 'image/jpeg' && mimeType !== 'image/png') {
            return reject(new Error('MIME type does not match image format'));
        }
        const isJpg = buffer.toString('hex', 0, 3) === 'ffd8ff';
        const isPng = buffer.toString('hex', 0, 4) === '89504e47';
        if ((ext === '.jpg' || ext === '.jpeg') && isJpg) {
            resolve(true);  // Valid JPG file
        } else if (ext === '.png' && isPng) {
            resolve(true);  // Valid PNG file
        } else {
            reject(new Error('Invalid image file type'));
        }
    });
}
function isTextFile(buffer :any) {
    for (let i = 0; i < buffer.length; i++) {
        const byte = buffer[i];
        if (byte < 32 || byte > 126) {
            if (byte !== 9 && byte !== 10 && byte !== 13) { 
                return false;
            }
        }
    }
    return true;
}
function checkuseruploadsMagicNumber(buffer: Buffer, fileName: string): Promise<boolean> {
    return new Promise((resolve, reject) => {
        if (!validateFilename(fileName)) {
            return reject(new Error('Filename contains forbidden characters'));
        }
        const dotCount = (fileName.match(/\./g) || []).length;
        const isSingleExtension = dotCount === 1;
        if (!isSingleExtension) {
            return reject(new Error('Filename contains multiple extensions'));
        }
        const ext = path.extname(fileName).toLowerCase();
        const mimeType = mime.lookup(fileName);
        // Check for ZIP (DOCX/XLSX)
        const isDOCXOrXLSX = buffer.readUInt32BE(0).toString(16) === '504b0304'; // ZIP signature (DOCX/XLSX)

        if  (ext === '.txt')  {
            if (isTextFile(buffer)) {
                if (mimeType === 'text/plain') {
                    resolve(true); // It's a valid text file
                } else {
                    reject(new Error('MIME type does not match file content'));
                }
            } else {
                reject(new Error('File appears to be binary, not a valid text file'));
            }
        } else if (isDOCXOrXLSX) {
            try {
                const zip = new AdmZip(buffer);
                const zipEntries = zip.getEntries();
                const isXLSX = zipEntries.some(entry => entry.entryName.startsWith('xl/'));
                //  'word/' directory (specific to DOCX)
                const isDOCX = zipEntries.some(entry => entry.entryName.startsWith('word/'));

                if (isXLSX) {
                    if ((ext === '.xlsx') && (mimeType === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')) {
                        resolve(true); // It's XLSX
                    } else {
                        reject(new Error('File extension does not match DOCX/XLSX content'));
                    }
                } {
                    reject(new Error('Invalid file structure'));
                }
            } catch (error) {
                reject(new Error('Invalid file type'));
            }
        } else {
            reject(new Error('Invalid file type'));
        }
    });
};
// Function to check magic number for attachments (PDF, DOCX, XLSX)
function checkAttachmentMagicNumber(buffer: Buffer, fileName: string): Promise<boolean> {
    return new Promise((resolve, reject) => {
        if (!validateFilename(fileName)) {
            return reject(new Error('Filename contains forbidden characters'));
        }
        const dotCount = (fileName.match(/\./g) || []).length;
        const isSingleExtension = dotCount === 1;
        if (!isSingleExtension) {
            return reject(new Error('Filename contains multiple extensions'));
        }
        const ext = path.extname(fileName).toLowerCase();
        const mimeType = mime.lookup(fileName);
        const ispdf = buffer.readUInt32BE(0).toString(16) === '25504446';
        // Check for ZIP (DOCX/XLSX)
        const isDOCXOrXLSX = buffer.readUInt32BE(0).toString(16) === '504b0304'; // ZIP signature (DOCX/XLSX)

        if (ispdf) {
            if (ext === '.pdf' && mimeType === 'application/pdf') {
                resolve(true); // It's a PDF
            } else {
                reject(new Error('File extension does not match PDF content'));
            }
        } else if (isDOCXOrXLSX) {
            try {
                const zip = new AdmZip(buffer);
                const zipEntries = zip.getEntries();
                const isXLSX = zipEntries.some(entry => entry.entryName.startsWith('xl/'));
                //  'word/' directory (specific to DOCX)
                const isDOCX = zipEntries.some(entry => entry.entryName.startsWith('word/'));

                if (isXLSX) {
                    if ((ext === '.xlsx') && (mimeType === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')) {
                        resolve(true); // It's XLSX
                    } else {
                        reject(new Error('File extension does not match DOCX/XLSX content'));
                    }
                } else if (isDOCX) {
                    if ((ext === '.docx') && (mimeType === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')) {
                        resolve(true); // It's either DOCX 
                    } else {
                        reject(new Error('File extension does not match DOCX/XLSX content'));
                    }
                } {
                    reject(new Error('Invalid file structure'));
                }
            } catch (error) {
                reject(new Error('Invalid file type'));
            }
        } else {
            reject(new Error('Invalid file type'));
        }
    });
};

export { checkImageMagicNumber, checkAttachmentMagicNumber, checkuseruploadsMagicNumber };