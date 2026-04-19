using StudentEnrollmentAPI as service from '../../srv/service';
annotate service.Courses with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : duration,
            Label : 'duration',
        },
        {
            $Type : 'UI.DataField',
            Value : fees,
            Label : 'fees',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Course Details',
            ID : 'CourseDetails',
            Target : '@UI.FieldGroup#CourseDetails',
        },
    ],
    UI.FieldGroup #CourseDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : 'Name',
            },
            {
                $Type : 'UI.DataField',
                Value : fees,
                Label : 'Fees',
            },
            {
                $Type : 'UI.DataField',
                Value : duration,
                Label : 'Duration',
            },
            {
                $Type : 'UI.DataField',
                Value : courseStatus,
                Label : 'Status',
            },
        ],
    },
);

