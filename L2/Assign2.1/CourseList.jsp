<%@ page import="ComputerScience.Course" %>
<%
    Course[] courseArray = new Course[3];
    courseArray[0] = new Course("CS101", "Introductory Computer Science", 3);
    courseArray[1] = new Course("CS102", "Data Structure\t", 3);
    courseArray[2] = new Course("CS103", "C++ Programming\t", 3);
%>
<html>
<head>
    <style>
       .defaultText{font-family:Helvetica,Arial; font-size:9pt;}
    </style>
</head>
<body>
     <table cellspacing="2" >
        <tr><td COLSPAN=3><hr></td></tr>
        <tr CLASS="defaultText"><th width="120">Course ID</th><th width="120">Course Title</th><th width="120">Credit Hrs</th></tr>
        <tr><td COLSPAN=3><hr></td></tr>

        <%
        for (int i = 0; i < courseArray.length; i++)
         {

        %>
        <tr><td COLSPAN=3><hr></td></tr>
        <tr CLASS="defaultText"><td width="120"><%=courseArray[i].getCourseId()%></td>
                                <td width="120"><%=courseArray[i].getCourseTitle()%></td>
                                <td width="120"><%=courseArray[i].getCreditHours()%></td>
       </tr>
        <%
         }
        %>

     </table>
</body>
</html>
