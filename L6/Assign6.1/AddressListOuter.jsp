<!-- Begin: AddressListOuter.jsp -->
<%@ page import="java.sql.*" %>

<html>
<head>
<style>
.defaultText{font-family:Helvetica,Arial;font-size:10pt;}
.tableOddRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#E6E6E6}
.tableEvenRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#FFFFFF}
</style>
</head>

<body>
<table WIDTH=90%>
<tr class="defaultText">
<td>Customer ID</td>
<td>First Name</td>
<td>Last Name</td>
<td>Address Line 1</td>
<td>City</td>
<td>State</td>
<td>Zip</td>
</tr>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/testdatabase?user=root&password=sesame");
Statement statement = connection.createStatement();
String sqlGetCustomerAddress = "select cs.customer_id, cs.first_name, cs.last_name,";
sqlGetCustomerAddress += "ad.address_line1, ad.city, ad.state, ad.zip ";
sqlGetCustomerAddress += "from customer cs left outer join address ad "; 
sqlGetCustomerAddress += "on  cs.customer_id = ad.customer_id";

ResultSet rs = statement.executeQuery(sqlGetCustomerAddress);

int customerId, zip;
String firstName, lastName, addressLine1, city, state, strClass = "tableEvenRow";
String Blank = "";

while (rs.next())
{
Blank = " " ;
customerId = rs.getInt("customer_id");
firstName = rs.getString("first_name");
lastName = rs.getString("last_name");
addressLine1 = rs.getString("address_line1");
city = rs.getString("city");
state = rs.getString("state");
zip = rs.getInt("zip");
// toggle style class for next row:
if (strClass.equals("tableEvenRow")) strClass = "tableOddRow";
else strClass = "tableEvenRow";
if (addressLine1 == null) addressLine1 = "";
if (city  == null) city = "";
if (state  == null) state  = "";
if (zip != 0) Blank = Integer.toString(zip);
%>
<tr class="<%= strClass %>">
<td><%= customerId %></td>
<td><%= firstName %></td>
<td><%= lastName %></td>
<td><%= addressLine1 %></td>
<td><%= city %></td>
<td><%= state %></td>
<td><%= Blank %></td>
</tr>
<%
} // while ...
%>
</table>
</body>
</html>
<!-- End: AddressListOuter.jsp -->