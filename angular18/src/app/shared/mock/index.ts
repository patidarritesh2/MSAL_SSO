export const preClearanceRequests = [
  {
    dateOfRequest: '12/03/2020',
    quantityRequested: '200',
    tradingType: 'Buy',
    isin: '7883',
    typeOfSecurity: 'Bonds',
    possessesUPSI: 'Yes',
    lastDateOfProposedTrading: '12/03/2020',
    estimatedTransitionValue: '1,75,000',
    action: 'Approve',
  },
  {
    dateOfRequest: '12/03/2020',
    quantityRequested: '250',
    tradingType: 'Buy',
    isin: '8201',
    typeOfSecurity: 'Bonds',
    possessesUPSI: 'No',
    lastDateOfProposedTrading: '12/03/2020',
    estimatedTransitionValue: '12,39,000',
    action: 'Approve',
  },
  {
    dateOfRequest: '12/03/2020',
    quantityRequested: '600',
    tradingType: 'Sell',
    isin: '5820',
    typeOfSecurity: 'Bonds',
    possessesUPSI: 'Yes',
    lastDateOfProposedTrading: '12/03/2020',
    estimatedTransitionValue: '24,000',
    action: 'Approve',
  },
  {
    dateOfRequest: '12/03/2020',
    quantityRequested: '150',
    tradingType: 'Buy',
    isin: '1947',
    typeOfSecurity: 'Bonds',
    possessesUPSI: 'Yes',
    lastDateOfProposedTrading: '12/03/2020',
    estimatedTransitionValue: '6,11,000',
    action: 'Approve',
  },
  {
    dateOfRequest: '12/03/2020',
    quantityRequested: '300',
    tradingType: 'Sell',
    isin: '2095',
    typeOfSecurity: 'Bonds',
    possessesUPSI: 'No',
    lastDateOfProposedTrading: '12/03/2020',
    estimatedTransitionValue: '2,86,000',
    action: 'Approve',
  },
];
// export const UPSISharedDetailsList =[
//   {
//     clientCompanyName: 'Crenexa',
//     sharedUPSI: '20/3/2021',
//     sharedPerson: 'Nupur',
//     upsiCategory: 'Lorem',
//     publishDate: '23/2/2021',
//     action: 'Approve',
//   },
//   {
//     clientCompanyName: 'Vorbitech',
//     sharedUPSI: '20/3/2021',
//     sharedPerson: 'Neel',
//     upsiCategory: 'Lorem',
//     publishDate: '27/2/2021',
//     action: 'Approve',
//   },
// ];

export const ConnectedPersonList = [
  {
    personName: 'John Doe',
    relcategory: 'OE',
    pan: 'HSG625GSAF',
    designation: 'Secondary Approver',
    deptName: 'Sales',
  },
  {
    personName: 'Mitchel Santner',
    relcategory: 'IR',
    pan: 'JAJKSJD625',
    designation: 'Designated Person',
    deptName: 'Trade',
  },
  {
    personName: 'Lina Hublis',
    relcategory: 'MFR',
    pan: 'HSGC7728GH',
    designation: 'Connecteed Person',
    deptName: 'Debentures',
  },
];
export const DesignatedPersonList = [
  {
    Id: '5009726618',
    personName: 'John Doe',
    city: 'pune',
    mobileNo: 7719827827,
    pan: 'HSG625GSAF',
    position: 'promoter',
    dateOfAddition: '12/03/2021',
    dateOfDeactivation: '12/03/2021',
    holdingShare: '150',
  },
  {
    Id: '5009726618',
    personName: 'John Doe',
    city: 'pune',
    mobileNo: 7719827827,
    pan: 'HSG625GSAF',
    position: 'promoter',
    dateOfAddition: '12/03/2021',
    dateOfDeactivation: '12/03/2021',
    holdingShare: '150',
  },
  {
    Id: '5009726618',
    personName: 'John Doe',
    city: 'pune',
    mobileNo: 7719827827,
    pan: 'HSG625GSAF',
    position: 'promoter',
    dateOfAddition: '12/03/2021',
    dateOfDeactivation: '12/03/2021',
    holdingShare: '150',
  },
];
export const ISINList = [
  { isinName: 'ISIN_DBR', isinCode: '1234', moreActions: '' },
  { isinName: 'ISIN_TDR', isinCode: '0987', moreActions: '' },
  { isinName: 'ISIN_VNT', isinCode: '5678', moreActions: '' },
  { isinName: 'ISIN_SUBS', isinCode: '4321', moreActions: '' },
];

export const RoleList = [
  { roleName: 'Compliance Officer', moreACtions: '' },
  { roleName: 'Designated Person', moreACtions: '' },
  { roleName: 'Secondary Approver', moreACtions: '' },
  { roleName: 'Connected Person', moreACtions: '' },
];

export const UPSICategory = [
  { upsicategoryname: 'ISIN_DBR', action: '' },
  { upsicategoryname: 'ISIN_DBR', action: '' },
  { upsicategoryname: 'ISIN_DBR', action: '' },
];

export const clientCompanyApproval = [
  {
    companyName: 'Crenexa',
    nseCode: 'REL',
    bseCode: '123',
    status: 'Approved',
    action: '',
  },
  {
    companyName: 'Vorbitech',
    nseCode: 'REL',
    bseCode: '123',
    status: 'Approved',
    action: '',
  },
  {
    companyName: 'Insiderlense',
    nseCode: 'REL',
    bseCode: '123',
    status: 'Approved',
    action: '',
  },
];

export const clientCompanyDetails = [
  { id: 1, companyName: 'Crenexa', nseCode: 'CRE', bseCode: '123' },
  { id: 2, companyName: 'Vorbitech', nseCode: 'VOR', bseCode: '123' },
  { id: 3, companyName: 'Infosys', nseCode: 'REL', bseCode: '123' },
];

export const holdingDisclosureView = [
  {
    disclosureFor: 'Crenexa',
    isin: 'AW92929329',
    disclosureDate: '1/2/2021',
    securitiesHeld: '1200',
    typeOfDisclosure: 'Annual',
    pledge: 'abcd',
    addedBy: '1111',
  },
  {
    disclosureFor: 'Crenexa',
    isin: 'AW92929329',
    disclosureDate: '1/2/2021',
    securitiesHeld: '1300',
    typeOfDisclosure: 'Annual',
    pledge: 'abcd',
    addedBy: '1111',
  },
  {
    disclosureFor: 'Crenexa',
    isin: 'AW92929329',
    disclosureDate: '1/2/2021',
    securitiesHeld: '1000',
    typeOfDisclosure: 'Annual',
    pledge: 'abcd',
    addedBy: '1111',
  },
];
export const tradeIntimationtradeIntimationForView = [
  {
    tradeIntimationFor: 'Crenexa',
    isin: 'AW92929329',
    transactionFor: '2/2/2021',
    quantity: '1200',
    value: 'Annual',
    openingBalance: 'abcd',
    closingBalance: '1111',
  },
  {
    tradeIntimationFor: 'Vorbitech',
    isin: 'XY92929329',
    transactionFor: '4/2/2021',
    quantity: '1400',
    value: 'Annual',
    openingBalance: 'abcd',
    closingBalance: '1111',
  },
  {
    tradeIntimationFor: 'Infosys',
    isin: 'AB92929329',
    transactionFor: '1/6/2021',
    quantity: '1600',
    value: 'Annual',
    openingBalance: 'abcd',
    closingBalance: '1111',
  },
];

export const idInformationView = [
  {
    idName: 'Voter Id',
    issuingAuthority: 'Election Commision of India',
    issuingCountry: 'India',
    issuingState: 'Maharashtra',
    action: '',
  },
  {
    idName: 'PAN',
    issuingAuthority: 'Income Tax Department',
    issuingCountry: 'India',
    issuingState: 'Maharashtra',
    action: '',
  },
  {
    idName: 'Aadhaar',
    issuingAuthority: 'Unique Identification Authority of India',
    issuingCountry: 'India',
    issuingState: 'Maharashtra',
    action: '',
  },
];

export const emailConfiguration = [

];
export const pledgeBalanceDisclosureView = [
  {
    nameOfPerson: 'James Brownings',
    isIn: '454545',
    dateOfDeclararationOfPledge: '02/04/2021',
    dateOfCreation: '01/04/2021',
    dateOfInvocation: '03/04/2021',
    dateOfRelease: '06/04/2021',
    balanceOfPledge: '1500',
    action: '',
  },
  {
    nameOfPerson: 'James Brownings',
    isIn: '454545',
    dateOfDeclararationOfPledge: '02/04/2021',
    dateOfCreation: '01/04/2021',
    dateOfInvocation: '03/04/2021',
    dateOfRelease: '06/04/2021',
    balanceOfPledge: '1500',
    action: '',
  },
  {
    nameOfPerson: 'James Brownings',
    isIn: '454545',
    dateOfDeclararationOfPledge: '02/04/2021',
    dateOfCreation: '01/04/2021',
    dateOfInvocation: '03/04/2021',
    dateOfRelease: '06/04/2021',
    balanceOfPledge: '1500',
    action: '',
  },
  {
    nameOfPerson: 'James Brownings',
    isIn: '454545',
    dateOfDeclararationOfPledge: '02/04/2021',
    dateOfCreation: '01/04/2021',
    dateOfInvocation: '03/04/2021',
    dateOfRelease: '06/04/2021',
    balanceOfPledge: '1500',
    action: '',
  },
];
export const emailProfileAccess = [
  {
    fromEvent:
      'Insiderlens>Pre-Clearance Request>Add>Pre-Clearance request alert',
    fromProfile: 'CompilanceOfficer',
  },
  {
    fromEvent: 'Insiderlens>Intimation of Trade>Add>Trade Intimation alert',
    fromProfile: 'Insiderlens',
  },
];

export const sentEmailView = [
  {
    Slno: '',
    sentTo: 'James Brownings',
    date: '04/03/2021',
    subject: 'Insiderlens DP not added more than 5 CP',
    body: 'Dear Madam/sir,This is to remind you that DP has not yet added more than 5 CP names and their data over the last 2 months',
    emailAddress: 'James@gmail.com',
  },
  {
    Slno: '',
    sentTo: 'James Brownings',
    date: '04/03/2021',
    subject: 'Insiderlens DP not added more than 5 CP',
    body: 'Dear Madam/sir,This is to remind you that DP has not yet added more than 5 CP names and their data over the last 2 months',
    emailAddress: 'James@gmail.com',
  },
  {
    Slno: '',
    sentTo: 'James Brownings',
    date: '04/03/2021',
    subject: 'Insiderlens DP not added more than 5 CP',
    body: 'Dear Madam/sir,This is to remind you that DP has not yet added more than 5 CP names and their data over the last 2 months',
    emailAddress: 'James@gmail.com',
  },
];

export const actionLogView = [
  {
    actionCategory: 'xyz',
    action: '',
    ipAddress: 'xyz',
    oldValue: 'xyz',
    newValue: 'xyz',
    user: 'xyz',
    timeStamp: 'xyz',
    primaryKey: 'xyz',
  },
  {
    actionCategory: 'xyz',
    action: '',
    ipAddress: 'xyz',
    oldValue: 'xyz',
    newValue: 'xyz',
    user: 'xyz',
    timeStamp: 'xyz',
    primaryKey: 'xyz',
  },
  {
    actionCategory: 'xyz',
    action: '',
    ipAddress: 'xyz',
    oldValue: 'xyz',
    newValue: 'xyz',
    user: 'xyz',
    timeStamp: 'xyz',
    primaryKey: 'xyz',
  },
];
export const configurableUndertaking = [
  'Badminton',
  'Basketball',
  'Cricket',
  'Golf',
  'Hockey',
  'Rugby',
];

export const upsiSharedList = [
  'Financial Results',
  'Dividents',
  'Change in capital structure',
  'Marketing alliance',
  'others',
];

export const auditLogUserList = [
  { key: 1, value: 'CO' },
  { key: 2, value: 'DP' },
  { key: 3, value: 'SA' },
  { key: 4, value: 'UO' },
  { key: 5, value: 'CP' },
];

export const auditLogModuleList = [
  { key: 1, value: 'UPSI' },
  { key: 2, value: 'Preclearance' },
  { key: 3, value: 'Trade Intimation' },
  { key: 4, value: 'CP' },
];

export const StockList = [
  { id: 1, name: 'BSE' },
  { id: 2, name: 'NSE' },
  { id: 4, name: 'MSE' },
];
export const ModesList = [
  { id: 1, name: 'On Market' },
  { id: 2, name: 'Public issue' },
  { id: 3, name: 'Right issue' },
  { id: 4, name: 'Prefential offer' },
  { id: 5, name: 'Off Market' },
  { id: 6, name: 'Inter-se Market' },
  { id: 7, name: 'ESOPs' },
  { id: 8, name: 'Other' },
];
