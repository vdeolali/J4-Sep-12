<!-- Begin: ProcessLogin.jsp -->
<%@page import="java.util.*, java.sql.*" %>
<%
String Uname = request.getParameter("username");
String Passwd = request.getParameter("password");
String username = "root";
String password = "sesame";
String dbURL = "jdbc:mysql://localhost:3306/orderdatabase";
String c_id;
Boolean notFound = Boolean.TRUE;

try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
//out.println ("Connecting to DB");
Connection connection = DriverManager.getConnection(dbURL, username, password);
Statement statement = connection.createStatement();
Statement statement2 = connection.createStatement();

//ResultSet usrname  = statement.executeQuery("SELECT username, password, customer_id FROM user");
ResultSet usrname = statement.executeQuery("SELECT customer_id, password FROM user WHERE username=" +"'"+Uname+"'");
ResultSet fname=null;

String FullName= "";
if (usrname.next()){
       out.println("Got Something" + "<br>");
       if (usrname.getString("password").equals(Passwd)){
	 out.println ("Found Him" + "<br>");
	 c_id = usrname.getString("customer_id");
	 fname = statement2.executeQuery("SELECT first_name, last_name from customer where customer_id=" +c_id);
	 if( fname.next()){
	   FullName = fname.getString("first_name");
	   FullName += " ";
	   FullName += fname.getString("last_name");
	 }
	 session.setAttribute ("FULL_NAME", FullName);
	 response.sendRedirect("ShowAllItems.jsp");
	 notFound = Boolean.FALSE;
      }
}
} catch (SQLException se){
    out.println ("Ops :" + se.getSQLState());
//    notFound = Boolean.TRUE;
}
if (notFound) response.sendRedirect("Login.jsp?state=error");
%>
<!-- End: ProcessLogin.jsp -->