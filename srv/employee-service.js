const cds = require('@sap/cds');

module.exports = class EmployeeService extends cds.ApplicationService{
    init() {

        const {Employees, Countries, Nationalities} = this.entities;

        this.after('UPDATE', Employees.drafts, async req =>{
            if(req.placeBirth_ID) {
                    const oCountry = await SELECT.one.from(Countries).where`ID=${req.placeBirth_ID}`;
                    const oNationality = await SELECT.one.from(Nationalities).where`code=${oCountry.code}`;
                    await cds.run(UPDATE.entity(Employees.drafts).set`nationality = ${oNationality.nationality}`.where`ID = ${req.ID}`);
            };
        });

        this.before('NEW', Employees.drafts, req => {
            req.data.address ??=[
               {
                country_ID:  "",
                deparment_ID: "",
                province_ID: "",
                region_ID: "",
               }
            ];

            req.data.contact ??=[
                {
                     phoneNumber: "",
                    email: ""
                }
            ];
        }) ;
        
        return super.init();
    }
}