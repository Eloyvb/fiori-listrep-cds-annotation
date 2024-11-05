using {EmployeeService as call} from '../employee-service';

annotate call.Contacts with {
    phoneNumber @title: 'Phone';
    email       @title: 'Email';
};

annotate call.Contacts with @(UI.FieldGroup #Contact: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: phoneNumber,
        },
        {
            $Type: 'UI.DataField',
            Value: email,
        },
    ]
});
