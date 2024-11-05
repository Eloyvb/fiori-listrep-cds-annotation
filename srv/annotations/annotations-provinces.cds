using {EmployeeService as call} from '../employee-service';

annotate call.Provinces with{
    ID
    @UI.Hidden
    @Common : { 
        Text : province,
        TextArrangement : #TextOnly,
     }
} ;
