using {
    cuid,
    managed
} from '@sap/cds/common';

using {
    com.nayar.Person,
    com.nayar.Countries,
    com.nayar.VH_Occupations,
    com.nayar.VH_UnitMeasurement,
} from './masterdata';

namespace com.nayar;

entity Employees : Person {
    toExperticies : Composition of many Experticies
                        on toExperticies.employee = $self;
};


entity Experticies : cuid, managed {
    country     : Association to Countries;
    company     : String(180);
    occupation  : Association to VH_Occupations;
    duration    : Int16                             @Measures.Unit: unitMeasure.symbol;
    unitMeasure : Association to VH_UnitMeasurement @Common.IsUnit;
    employee    : Association to Employees;
};
