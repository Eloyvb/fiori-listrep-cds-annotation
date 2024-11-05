using {EmployeeService as call} from '../employee-service';

annotate call.Regions with {
    ID
    @UI.Hidden
    @Common : { 
        Text : region,
        TextArrangement : #TextOnly,
     }
};