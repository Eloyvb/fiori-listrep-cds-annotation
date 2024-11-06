using {EmployeeService as call} from '../employee-service';
using from './annotations-address';
using from './annotations-contacts';
using from './annotations-experticies';


annotate call.Employees with @odata.draft.enabled;



annotate call.Employees with {
    pictureUrl     @title: 'Photo';
    typeUser       @title: 'Type USer';
    typeDocument   @title: 'Type Documents';
    numberDocument @title: 'Number Document';
    firstName      @title: 'First Name';
    secondName     @title: 'Second Name';
    surname        @title: 'Surname';
    secondSurname  @title: 'Second Surname';
    birthdate      @title: 'Birth Date';
    placeBirth     @title: 'Place Birth';
    nationality    @title: 'Nationality';
    gender         @title: 'Gender';
    civilStatus    @title: 'Civil Status';
    statu          @title: 'Statu';
};


annotate call.Employees with @(
    UI.SelectionFields: [
        gender_code,
        civilStatus_code,
        statu_code
    ],
    UI.HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Employee',
        TypeNamePlural: 'Employees',
        Title         : {
            $Type: 'UI.DataField',
            Value: numberDocument
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: contact.email,
        },
    },
    UI.LineItem       : [
        {
            $Type            : 'UI.DataField',
            Value            : pictureUrl,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            :  typeUser.name,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : numberDocument,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : firstName,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : surname,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : birthdate,
            ![@UI.Importance]: #Low
        },
        {
            $Type            : 'UI.DataField',
            Value            : nationality,
            ![@UI.Importance]: #Low
        },
        {
            $Type            : 'UI.DataField',
            Value            : gender_code,
            ![@UI.Importance]: #Low
        },
        {
            $Type            : 'UI.DataField',
            Value            : civilStatus_code,
            ![@UI.Importance]: #Low
        },
        {
            $Type            : 'UI.DataField',
            Value            : statu_code,
            Criticality: criticality,
            ![@UI.Importance]: #High
        },
    ],
    UI.Identification : [
        {
            $Type: 'UI.DataField',
            Value: pictureUrl,

        },
        {
            $Type: 'UI.DataField',
            Value: typeUser_code,

        },
        {
            $Type: 'UI.DataField',
            Value: numberDocument,

        },
        {
            $Type: 'UI.DataField',
            Value: firstName,

        },
        {
            $Type: 'UI.DataField',
            Value: secondName,

        },
        {
            $Type: 'UI.DataField',
            Value: surname,

        },
        {
            $Type: 'UI.DataField',
            Value: secondSurname,

        },
        {
            $Type: 'UI.DataField',
            Value: birthdate,

        },
        {
            $Type: 'UI.DataField',
            Value: placeBirth_ID,

        },
        {
            $Type: 'UI.DataField',
            Value: nationality,

        },
        {
            $Type: 'UI.DataField',
            Value: gender_code,

        },
        {
            $Type: 'UI.DataField',
            Value: civilStatus_code,

        },
        {
            $Type: 'UI.DataField',
            Value: statu_code,
            Criticality: criticality,

        }
    ],
    UI.Facets         : [{
        $Type : 'UI.CollectionFacet',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.Identification',
            Label : 'Personal Information.'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: 'address/@UI.FieldGroup#Address',
            Label: 'Address',
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: 'contact/@UI.FieldGroup#Contact',
            Label: 'Contact',
        }
        ],
        Label : 'General Information.'
     },
     {
       $Type: 'UI.ReferenceFacet',
       Target: 'toExperticies/@UI.LineItem#Experticies',
       Label: 'Experticies',
     },
]
);


annotate call.Employees with {
    placeBirth @Common : { 
        Text : placeBirth.country,
        TextArrangement : #TextOnly,
        ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Countries',
            Parameters: [
                {
                    $Type: 'Common.ValueListParameterInOut',
                    LocalDataProperty: placeBirth_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'country',
                },
            ],
        },
     }
} ;


annotate call.Employees with @(
    Common.SideEffects:{
        $Type: 'Common.SideEffectsType',
        SourceProperties: [
            placeBirth_ID
        ],
        TargetProperties: [
            'nationality',
        ],
    }
);