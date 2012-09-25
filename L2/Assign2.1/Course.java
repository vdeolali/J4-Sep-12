// -------- Begin: Course.java ----------------
package ComputerScience;
public class Course
{
    String courseId;
    String courseTitle; 
    int creditHours;
    public Course()
    {
        courseId = "";
        courseTitle = "";
        creditHours = 0;
    }
    public Course (String courseId, String courseTitle, int creditHours)
    {
        this.courseId = courseId;   // OR: setCourseId(courseId);
        this.courseTitle = courseTitle;   // OR: setCourseTitle(courseTitle);
        this.creditHours = creditHours;   // OR: setCreditHours(creditHours)
    }

    // Getters:
    public String getCourseId() { return courseId; }
    public String getCourseTitle() { return courseTitle; }
    public int getCreditHours() { return creditHours; }

    // Setters:
    public void setCourseId(String courseId) { this.courseId = courseId; }
    public void setCourseTitle(String courseTitle) { this.courseTitle = courseTitle; }
    public void setCreditHours(int creditHours) { this.creditHours = creditHours; }
}
// -------- End: Course.java ----------------