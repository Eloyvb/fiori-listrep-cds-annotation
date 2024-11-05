using {EmployeeService as call} from '../employee-service';

annotate call.Experticies with {
    country     @title: 'Country';
    company     @title: 'Company';
    occupation  @title: 'Occupation';
    duration    @title: 'Duration';
    unitMeasure @title: 'Unit Measure'
};


annotate call.Experticies with {
    country @Common: {
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
    occupation @Common : { 
        Text : occupation.occupation,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'VH_Occupations',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: occupation_ID,
                    ValueListProperty: 'ID',
                },
                {
                   $Type: 'Common.ValueListParameterDisplayOnly',
                   ValueListProperty: 'occupation',
                },
            ]
        },

     };
     unitMeasure @Common : { 
         Text : unitMeasure.symbol,
         TextArrangement : #TextOnly,
         ValueList : {
             $Type : 'Common.ValueListType',
             CollectionPath : 'VH_UnitMeasurement',
             Parameters : [
                 {
                   $Type: 'Common.ValueListParameterInOut',
                   LocalDataProperty: unitMeasure_ID,
                   ValueListProperty: 'ID',    
                 },
                 {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'symbol',
                 },
             ]
         },
      } 
};

//Es un LineItem porque se agrega en la parte de abajo de los datos principales
//y se agrega en el Faces de la anotación persona
//Como va agregar mas de un registro sobre esta entidad, se le agrega tambien un headerInfo y un facets
annotate call.Experticies with @(
    UI.HeaderInfo            : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Experticie',
        TypeNamePlural: 'Experticies',
        Title: {
            $Type: 'UI.DataField',
            Value: employee.numberDocument,
        },
        Description: {
            $Type: 'UI.DataField',
            Value: employee.contact.phoneNumber,
        }

    },
    UI.LineItem #Experticies : [
        {
            $Type: 'UI.DataField',
            Value: country_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: company,
        },
        {
            $Type: 'UI.DataField',
            Value: occupation_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: duration,
        },
        {
            $Type: 'UI.DataField',
            Value: unitMeasure_ID,
        },
    ],
    UI.FieldGroup #FieldGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: country_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: company,
            },
            {
                $Type: 'UI.DataField',
                Value: occupation_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: duration,
            },
            {
                $Type: 'UI.DataField',
                Value: unitMeasure_ID,
            },
        ]
    },
    UI.Facets                : [{

        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#FieldGroup',
        Label : 'Experticie.'
    },

    ],

);




