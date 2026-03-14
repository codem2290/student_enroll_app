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
}

entity Courses : cuid, managed {
    //courseId        : UUID;
    name            : String;
    duration        : Integer;
    fees            : amountType;
    trainerName     : String;
    trainerSkillset : String;
}

entity Enrollments : cuid, managed {
    //enrollId     : UUID;
    feesPaid     : amountType;
    enrolledDate : Date;
    studentName  : String;
    status       : String;
}

entity Trainers : cuid {
    //trainerId : UUID;
    name      : String;
    expertise : String;
}

entity TrainerSkills {
    key code : String;
        desc : String;
}

entity Status {
    key code : String;
        desc : String;
}

entity NewEntity {
    key code : String;
}
