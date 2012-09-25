import ComputerScience.Course;
class TestCourse{

    public static void main (String[] args){
	Course [] courseArray = new Course[3];
	
	courseArray[0] = new Course("CS101", "Introductory Computer Science", 3);
        courseArray[1] = new Course("CS102", "Data Structure\t", 3);
        courseArray[2] = new Course("CS103", "C++ Programming\t", 4);

	System.out.println ("********************************************\n");
	System.out.println  ("\t\t   Courses Offered  \t \t \n");
	System.out.println ("********************************************\n");
	System.out.println ("\tCourseID" + "\tCourse Title" + "\tCredit Hrs");

	//	System.out.println (Arrays.toString(courseArray));
	for (int i = 0; i < courseArray.length ; i++){
	    courseArray[i].printCourse();
	}
     }
}