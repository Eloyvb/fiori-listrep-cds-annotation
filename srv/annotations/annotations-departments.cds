using {EmployeeService as call} from '../employee-service';

annotate call.Departments with {
    ID
    @UI.Hidden
    @Common: {
        Text           : deparment,
        TextArrangement: #TextOnly,
    }
};
