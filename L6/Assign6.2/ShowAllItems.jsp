<!-- Begin: ShowAllItems.jsp -->
<%@ page import="java.sql.*" %>

<HTML>
<HEAD>
    <STYLE TYPE="text/css">
	.defaultText{font-family:Helvetica,Arial;font-size:10pt;}
	.tableEvenRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#E6E6E6;}
	.tableOddRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#FFFFFF;}
    </STYLE>
</HEAD>
<BODY>
<FORM action="SelectMore.jsp" METHOD="POST">
<table align="center">
<tr class="tableEvenRow">
<td></td>
<td>Item #</td>
<td>Item Name</td>
<td>Price</td>
<td>Quantity</td>
</tr>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/orderdatabase?user=root&password=sesame");
Statement statement = connection.createStatement();
String sqlItemList = "SELECT * FROM item";
ResultSet rs = statement.executeQuery(sqlItemList);

int it_id, it_qty=0;
double it_price;
String it_name, strClass = "tableEvenRow";
String Blank = "";


String[] select = new String[4];
int i=0; 
while (rs.next())
{
Blank = " " ;
it_id = rs.getInt("item_id");
it_price = Double.parseDouble(rs.getString("item_price").toString());
it_name = rs.getString("item_name");
// toggle style class for next row:
if (strClass.equals("tableEvenRow")) strClass = "tableOddRow";
else strClass = "tableEvenRow";
%>

<tr class="<%= strClass%>">
<td><INPUT type="checkbox" name=<%=it_name+"Select"%>></INPUT></td>
<td><%=it_id %></td>
<td><%=it_name%></td>
<td><%=it_price%></td>
<td><%=it_qty%></td>
<td>
 <INPUT type="text" name=<%=it_name+"Qty"%> size="3" value="1"></INPUT>
</td>
</tr>

<%
i++;
} // while ...
%>
<tr class="defaultText">
  <td align="center" colspan=5>
       <INPUT type="submit" name="submit" value="Submit"</INPUT>
  </td>
</tr>

</TABLE>
</FORM>
</BODY>
</HTML>
<!-- End: ShowAllItems.jsp -->