<%@ page import="java.sql.*" %>
<html>
<head>
    <style>
        .defaultText{font-family:Helvetica,Arial;font-size:10pt;}
        .tableOddRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#E6E6E6;}
        .tableEvenRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#FFFFFF;}
    </style>
</head>
<body>
    <table>
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
            Connection connection
                    = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/testdatabase?user=root&password=sesame");
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * from customer, address WHERE customer.customer_id=address.customer_id");

            int customerId = 0, age = 0, zip=0;
            String firstName = "", lastName = "", strClass = "tableEvenRow";
            double orderVal = 0.0;
            String addLine="", city="", state="";
          

            while (rs.next())
            {
                customerId = rs.getInt("customer_id");
//                age = rs.getInt("age");
//                orderVal = rs.getDouble("order_value");
                firstName = rs.getString("first_name");
                lastName = rs.getString("last_name");
                addLine = rs.getString("address_line1");
                city  = rs.getString("city");
                state  = rs.getString("state");
                zip  = rs.getInt("zip");
                // toggle style class for next row:
                if (strClass.equals("tableEvenRow")) strClass = "tableOddRow";
                else strClass = "tableEvenRow";
            %>
            <tr class="<%= strClass %>">
                <td><%= customerId %></td>
                <td><%= firstName %></td>
                <td><%= lastName %></td>
                <td><%= addLine %></td>
                <td><%= city %></td>
                <td><%= state %></td>
                <td><%= zip %></td>
            </tr>
        <%
        } // while ...
        %>
    </table>
</body>
</html>