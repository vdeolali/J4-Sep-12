<!-- Begin: CustomerList.jsp -->
<%@ page import="salesDept.Customer" %>
<%
    Customer[] cst = new Customer[3];
    cst [0] = new Customer("Judy", "Miller", 150.0);
    cst [1] = new Customer("Jane", "Armstrong", 100.0);
    cst [2] = new Customer("Mike", "Johnson", 200.0);
    double totSales = 0.0, orderVal = 0.0;
%>
<html>
<head>
    <style>
        .defaultText{font-family:Helvetica,Arial;font-size:9pt;}
    </style>
</head>
<body>
    <table>
        <tr><td COLSPAN=3><hr></td></tr>
        <tr CLASS="defaultText"><td>#</td><td>Name</td><td>Sales Amount</tr>
        <tr><td COLSPAN=3><hr></td></tr>
        <%
        for (int i = 0; i < cst.length; i++)
        {
            orderVal = cst[i].orderValue;
            totSales += orderVal;
        %>
            <tr CLASS="defaultText">
                <td><%= (i+1) %></td>
                <td><%= cst[i].concatName() %></td>
                <td><%= orderVal %></td>
            </tr>
        <%
        }
        %>
            <tr><td COLSPAN=3><hr></td></tr>
            <tr CLASS="defaultText">
                <td COLSPAN=2>Total</td>
                <td><%= totSales %></td>
            </tr>
            <tr><td COLSPAN=3><hr></td></tr>
        </table>
</body>
</html>
<!-- End: CustomerList.jsp -->