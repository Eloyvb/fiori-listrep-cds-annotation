using {
    cuid,
    managed,
    sap.common.CodeList,
} from '@sap/cds/common';

namespace com.nayar;


@cds.autoexpose
aspect MasterData {};

entity Person : MasterData, cuid, managed {
    typeUser       : Association to VH_typeUser;
    pictureUrl     : LargeBinary                    @UI.IsImage     @Core.MediaType: 'image/png';
    typeDocument   : Association to VH_typeDocument @Common.IsUnit;
    numberDocument : String(12)                     @assert.unique  @mandatory  @Measures.Unit: typeDocument_code;
    firstName      : String(40)                     @mandatory;
    secondName     : String(40);
    surname        : String(40)                     @mandatory;
    secondSurname  : String(40);
    birthdate      : Date                           @mandatory;
    placeBirth     : Association to Countries       @mandatory;
    nationality    : String;
    gender         : Association to VH_Genders      @mandatory;
    civilStatus    : Association to VH_CivilStatus  @mandatory;
    statu          : Association to VH_Status;
    address        : Composition of Addresses;
    contact        : Composition of Contacts;
};

entity Addresses : cuid {
    country    : Association to Countries   @mandatory;
    deparment  : Association to Departments @mandatory;
    province   : Association to Provinces   @mandatory;
    region     : Association to Regions     @mandatory;
    address    : String;
    postalCode : String;
};

entity Contacts : cuid {
    phoneNumber : String(14);
    email       : String(120);
};

entity Countries : MasterData, cuid {
    code         : Int16;
    iso_2        : String(2);
    iso_3        : String(3);
    country      : String(120);
    nationality  : Association to Nationalities
                       on nationality.code = code;
    toDeparments : Composition of many Departments
                       on toDeparments.country = $self;
};

entity Nationalities : MasterData {
    key code        : Int16;
        iso_2       : String(2);
        nationality : String(120);
};

entity Departments : MasterData, cuid {
    deparment   : String(120);
    capital     : String(120);
    country     : Association to Countries;
    toProvinces : Composition of many Provinces
                      on toProvinces.deparment = $self;
}

entity Provinces : MasterData, cuid {
    province  : String(120);
    deparment : Association to Departments;
    toRegions : Composition of many Regions
                    on toRegions.province = $self;
};

entity Regions : MasterData, cuid {
    region   : String(120);
    province : Association to Provinces;
}

@readonly
entity VH_typeUser : MasterData, CodeList {
    key code : String(5) enum {
            Administrator = 'Admin';
            Operator      = 'Oper';
            Ghues         = 'Gues';
        };
};

@readonly
entity VH_typeDocument : MasterData, CodeList {
    key code : String enum {
            CI;
            J;
            E;
            G;
            P;
        };
};

@readonly
entity VH_Genders : MasterData, CodeList {
    key code : String enum {
            Female = 'F';
            Male   = 'M'
        };
}

@readonly
entity VH_CivilStatus : MasterData, CodeList {
    key code : String enum {
            Single   = 'S';
            Married  = 'C';
            Divorced = 'D';
            Widover  = 'V'
        };
};

@readonly
entity VH_Status : MasterData, CodeList {
    key code : String enum {
            Active   = '3';
            Inactive = '1';
            Pending  = '2';
        } default '1';
};

@readonly
entity VH_Occupations : MasterData, cuid {
    occupation : String(120);
};

@readonly
entity VH_UnitMeasurement : MasterData, cuid {
    unitMeasure : String(80);
    symbol      : String(8);
};
