using {EmployeeService as call} from '../employee-service';

annotate call.VH_Occupations with {
    ID
    @UI.Hidden
    @Common : { 
        Text : occupation,
        TextArrangement : #TextOnly,
     }
};





