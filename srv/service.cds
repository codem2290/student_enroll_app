using {application.tables as datamodel} from '../db/data-model';


service StudentEnrollmentAPI {
    entity Students     as projection on datamodel.Students;
    entity Trainers     as projection on datamodel.Trainers;
    entity Courses      as projection on datamodel.Courses;
    entity Status       as projection on datamodel.Status;
    entity Enrollements as projection on datamodel.Enrollments;
}
