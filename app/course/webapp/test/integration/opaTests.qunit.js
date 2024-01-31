sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'course/test/integration/FirstJourney',
		'course/test/integration/pages/CoursesList',
		'course/test/integration/pages/CoursesObjectPage'
    ],
    function(JourneyRunner, opaJourney, CoursesList, CoursesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('course') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCoursesList: CoursesList,
					onTheCoursesObjectPage: CoursesObjectPage
                }
            },
            opaJourney.run
        );
    }
);