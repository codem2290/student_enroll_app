const cds = require('@sap/cds');
const { UPDATE } = require('@sap/cds/lib/ql/cds-ql');

class StudentEnrollmentAPI extends cds.ApplicationService {
    async init() {
        const { Courses, SalseorderSet } = this.entities;
        const s4hanasystem = await cds.connect.to('SalesOrderService');

        this.on('activateCourse', async (req) => {
            try {
                const courseID = req.data.courseID;
                if (courseID) {
                    let courseData = await SELECT.from(Courses).where({
                        ID: courseID
                    });

                    if (courseData.length > 0) {
                        let updated = await UPDATE(Courses, courseID).with({
                            courseStatus: "Activated"
                        });

                        if (updated) {
                            return req.info("Status Updated SuccessFully!")
                        }
                    }
                }
            } catch (error) {
                req.error(400, "Failed to update Status", error);
            }



        });

        this.on('ReadCourseDataProcedure', async (req) => {
            let query = `CALL "ReadCourseData"( COURSE_DATA=>?, ENROLLMENT_DATA=>?)`;

            let data = await cds.run(query);

            if (data) {
                let response = {
                    courseData: data.COURSE_DATA,
                    enrollmentData: data.ENROLLMENT_DATA
                };

                return response;
            }

        });

        this.on('READ', SalseorderSet, async (req) => {
            return await s4hanasystem.run(req.query);
        });

        return super.init();
    }
}

module.exports = StudentEnrollmentAPI;