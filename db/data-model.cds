namespace application.tables;

using {
    cuid,
    managed
} from '@sap/cds/common';

type amountType : Decimal(10, 2);

entity Students : cuid {
    //key studentId     : UUID;
    name          : String(50);
    emailId       : String(50);
    address       : String;
    city          : String;
    qualification : String;
    dateOfBirth   : Date;
    age           : Integer;
    image         : LargeBinary @Core.MediaType: 'image/png';
}

entity Courses : cuid, managed {
    //courseId        : UUID;
    name        : String;
    duration    : Integer;
    fees        : amountType;
    trainer     : Association to Trainers;
    enrollments : Composition of many Enrollments
                      on enrollments.course = $self;
}

entity Enrollments : cuid, managed {
    //enrollId     : UUID;
    feesPaid     : amountType;
    enrolledDate : Date;
    student      : Association to Students;
    status       : Association to Status;
    course       : Association to Courses; // Managed Association
}

entity Trainers : cuid {
    //trainerId : UUID;
    name      : String;
    expertise : String;
}

entity Status {
    key code : String;
        desc : String;
}
