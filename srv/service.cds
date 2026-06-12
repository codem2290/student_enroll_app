using {application.tables as datamodel} from '../db/data-model';
using {SalesOrderService as externalService} from './external/SalesOrderService';

service StudentEnrollmentAPI {
    @readonly
    entity Students      as projection on datamodel.Students
        actions {
            action updateStudentValidity(studentID: String) returns String //Bound Action
        };

    @Capabilities: {
        InsertRestrictions.Insertable: true,
        UpdateRestrictions.Updatable : true,
        DeleteRestrictions.Deletable : false
    }
    entity Trainers      as projection on datamodel.Trainers;

    @odata.draft.enabled
    entity Courses @(restrict: [
        {
            grant: ['READ', 'WRITE'],
            to: 'admin'
        },
        {
            grant: ['READ'],
            to: 'employee'
        }
    ])      as projection on datamodel.Courses;

    entity Status        as projection on datamodel.Status;
    entity Enrollements  as projection on datamodel.Enrollments;

    entity SalseorderSet as projection on externalService.SalseorderSet;

    action   activateCourse(courseID: String) returns String; //Unbound Action
    function ReadCourseDataProcedure()        returns String;

}
