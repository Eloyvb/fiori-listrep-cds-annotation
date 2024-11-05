using {EmployeeService as call} from '../employee-service';

annotate call.Countries with {
    ID
    @UI.Hidden
    @Common: {
        Text           : country,
        TextArrangement: #TextOnly,
    };
};
