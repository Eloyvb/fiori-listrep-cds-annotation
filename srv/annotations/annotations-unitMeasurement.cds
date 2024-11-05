using {EmployeeService as call} from '../employee-service';

annotate call.VH_UnitMeasurement with {
    ID
    @UI.Hidden
    @Common : { 
        Text : symbol,
        TextArrangement : #TextOnly,
     }
} ;


