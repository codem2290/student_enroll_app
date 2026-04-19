sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/student/app/studentappenroll/test/integration/pages/CoursesList",
	"com/student/app/studentappenroll/test/integration/pages/CoursesObjectPage"
], function (JourneyRunner, CoursesList, CoursesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/student/app/studentappenroll') + '/test/flp.html#app-preview',
        pages: {
			onTheCoursesList: CoursesList,
			onTheCoursesObjectPage: CoursesObjectPage
        },
        async: true
    });

    return runner;
});

