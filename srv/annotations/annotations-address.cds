using {EmployeeService as call} from '../employee-service';

annotate call.Addresses with {
    country    @title: 'Country';
    deparment  @title: 'Department';
    province   @title: 'Province';
    region     @title: 'Region';
    address    @title: 'Address';
    postalCode @title: 'Postal Code';
};

annotate call.Addresses with {
    country   @Common: {
        Text           : country.country,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Countries',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: country_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'country'
                },
            ]
        },
    };
    deparment @Common: {
        Text           : deparment.deparment,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Departments',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterIn',
                    LocalDataProperty: country_ID,
                    ValueListProperty: 'country_ID',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: deparment_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'deparment'
                },
            ]
        },
    };
};
//En Countries no se redefinio por que es la base y no depende de otra entiendad


/*
annotate call.Addresses with{
    deparment @Common : {
        Text : deparment.deparment,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Departments',
            Parameters: [
                {
                 $Type: 'Common.ValueListParameterInOut',
                 LocalDataProperty: deparment_ID,
                 ValueListProperty: 'ID',
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'deparment',
                },
                 {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'deparment'
                },
            ]
        },
     }
} ;
*/
//Reconfigurando los Match Code, para mostrar con base a algo anterior relacionado
//En este caso mostrar los estados correspondientes al país seleccionado
/*
annotate call.Addresses with {
    deparment @Common: {
        Text           : deparment.deparment,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Departments',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterIn',
                    LocalDataProperty: country_ID,
                    ValueListProperty: 'country_ID',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: deparment_ID,
                    ValueListProperty: 'ID'
                },
            ]
        },
    }
};
*/
annotate call.Addresses with {
    province @Common: {
        Text           : province.province,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Provinces',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterIn',
                    LocalDataProperty: deparment_ID,
                    ValueListProperty: 'deparment_ID',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: province_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'province',
                },
            ]
        },
    }
};

annotate call.Addresses with {
    region @Common: {
        Text           : region.region,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Regions',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterIn',
                    LocalDataProperty: province_ID,
                    ValueListProperty: 'province_ID',
                },
                {
                    $Type            : 'Common.ValueListParameterOut',
                    LocalDataProperty: region_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'region',
                },
            ]
        },
    }
};


annotate call.Addresses with @(UI.FieldGroup #Address: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: country_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: deparment_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: province_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: region_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: address,
        },
        {
            $Type: 'UI.DataField',
            Value: postalCode,
        },
    ],
});
