<!-- Begin: ViewOrderDetails.jsp -->
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
<TABLE>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/orderdatabase?user=root&password=sesame");
Statement statement = connection.createStatement();

String o_id = request.getParameter("order_id");
//out.println(o_id);

String sqlGetCustomerInfo="SELECT cs.first_name, cs.last_name, cs.customer_id, us.username, us.user_id, ";
sqlGetCustomerInfo += "os.submit_date FROM customer cs INNER ";
sqlGetCustomerInfo += "JOIN user us ON cs.customer_id = us.customer_id ";
sqlGetCustomerInfo += "INNER JOIN order_submitted os ON us.user_id = os.user_id ";
sqlGetCustomerInfo += "WHERE order_id = "+o_id+"";
ResultSet rs2 = statement.executeQuery(sqlGetCustomerInfo);
int cus_id=0, us_id = 0;
String usrname = "", fname = "", lname = "", date = "";

if (rs2.next()){
  cus_id = rs2.getInt("customer_id");
  us_id  = rs2.getInt("user_id");
  usrname = rs2.getString ("username");
  fname  = rs2.getString ("first_name");
  lname = rs2.getString ("last_name");
  date = rs2.getString ("submit_date");
}

//Get the total value
String sqlGetOrderTotal = "SELECT sum(it.item_price * od.item_qty) as value ";
sqlGetOrderTotal +=  "FROM order_detail od INNER JOIN item it ";
sqlGetOrderTotal +=  "ON od.item_id = it.item_id ";
sqlGetOrderTotal +=  "WHERE od.order_id = "+o_id+"";
ResultSet rs3 = statement.executeQuery(sqlGetOrderTotal);
double order_value = 0.0;

if (rs3.next()){
   order_value = rs3.getDouble ("value");
}

%>
<tr class="defaultText"><td colspan=3><hr></td></tr>
<tr>
   <td align="left"> Customer Id: </td>
   <td> <%=cus_id %></td>
</tr>
<tr>
   <td> User Id:</td>
   <td> <%=us_id %></td>
</tr>

<tr>
   <td> Username:</td>
   <td> <%=usrname %></td>
</tr>
<tr>
   <td> Name:</td>
   <td> <%=fname+" " +lname%> </td>
</tr>
<tr>
   <td> Order ID:</td>
   <td> <%=o_id %></td>
</tr>
<tr>
   <td> Order Value:</td>
   <td> <%=order_value %> </td>
</tr>
<tr>
   <td> Submit Date:</td>
   <td> <%=date %> </td>
</tr>
<tr class="defaultText"><td colspan=3><hr></td></tr>
<tr>
<td>Order Details:</td>
<td/>
<td/>
</tr>
<tr class="defaultText"><td colspan=5><hr></td></tr>
<tr>
<td> Item ID </td>
<td> Item Name </td>
<td> Qty</td>
<td> Price</td>
<td> Value</td>
</tr>
<tr class="defaultText"><td colspan=5><hr></td></tr>
<%
String sqlOrderDetail = "select od.order_id, od.item_id, it.item_name, od.item_qty, ";
sqlOrderDetail += "it.item_price, od.item_qty*it.item_price as OV ";
sqlOrderDetail += "FROM order_detail od INNER ";
sqlOrderDetail += "JOIN item it ";
sqlOrderDetail += "ON od.item_id=it.item_id ";
sqlOrderDetail += "WHERE od.order_id = "+o_id+" ";
ResultSet rs = statement.executeQuery(sqlOrderDetail);

String item_name = "";
int    item_id=0, item_qty=0;
double item_value = 0.0, item_price=0.0, total_order = 0.0;
String strClass = "tableEvenRow";
while (rs.next()){
   item_id = rs.getInt("item_id");
   item_qty = rs.getInt("item_qty");
   item_name = rs.getString("item_name");
   item_price = rs.getDouble("item_price");
   item_value = rs.getDouble("OV");
   total_order += item_value;

// toggle style class for next row:
  if (strClass.equals("tableEvenRow")) strClass = "tableOddRow";
  else strClass = "tableEvenRow";
%>
<tr class="strClass">
<td> <%=item_id%> </td>
<td> <%=item_name%> </td>
<td> <%=item_qty%> </td>
<td> <%=item_price%> </td>
<td> <%=item_value%> </td>
</tr>
<%
  }
%>

<tr class="defaultText"><td colspan=5><hr></td></tr>
<tr>
<td> Total: </td>
<td> <%=total_order %> </td>
</tr>
<tr class="defaultText"><td colspan=5><hr></td></tr>

</TABLE>
</BODY>
</HTML>
<!-- End: ViewOrderDetails.jsp -->