<!-- Begin: Checkout.jsp -->
<%
    boolean bPenSelect = false, bPencilSelect = false, bEraserSelect = false;
    String penQty = "1", pencilQty = "1", eraserQty = "1";
    double totalBill = 0.0; String penSelect = request.getParameter("penSelect");
    if (penSelect != null && penSelect.equals("on"))
    {
        bPenSelect = true;
        penQty = request.getParameter("penQty");
        totalBill += Integer.parseInt(penQty) * 2.00;
    }
    String pencilSelect = request.getParameter("pencilSelect");
    if (pencilSelect != null && pencilSelect.equals("on"))
    {
        bPencilSelect = true;
        pencilQty = request.getParameter("pencilQty");
        totalBill += Integer.parseInt(pencilQty) * 1.00;
    }
    String eraserSelect = request.getParameter("eraserSelect");
    if (eraserSelect != null && eraserSelect.equals("on"))
    {
        bEraserSelect = true;
        eraserQty = request.getParameter("eraserQty");
        totalBill += Integer.parseInt(eraserQty) * 0.50;
    }
%>
<HTML>
<HEAD>
    <STYLE TYPE="text/css">
        .defaultText{font-family:Helvetica,Arial;font-size:10pt;}
        .tableEvenRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#E6E6E6;}
        .tableOddRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#FFFFFF;}
    </STYLE>
</HEAD>
<BODY>
    Thank you <%=session.getAttribute("FULL_NAME") + " " %>, for your order! The details of your order are as follows:<br><br>
    <table>
        <tr class="tableEvenRow">
            <td>Item #</td>
            <td>Item Name</td>
            <td>Price</td>
            <td>Quantity</td>
        </tr>
        <%
        if (bPenSelect)
        {
        %>
        <tr class="tableOddRow">
            <td>101</td>
            <td>Pen</td>
            <td>2.00</td>
            <td><%= penQty %></td>
        </tr>
        <%
        }
        if (bPencilSelect)
        {
        %>
            <tr class="tableEvenRow">
                <td>102</td>
                <td>Pencil</td>
                <td>1.00</td>
                <td><%= pencilQty %></td>
            </tr>
        <%
        }
        if (bEraserSelect)
        {
        %>
            <tr class="tableOddRow">
                <td>103</td>
                <td>Eraser</td>
                <td>0.50</td>
                <td><%= eraserQty %></td>
            </tr>
        <%
        }
        %>
            <tr class="defaultText"><td colspan=4><hr></td></tr>
            <tr class="defaultText">
                <td colspan=4 align="center"> Total Bill: <%= totalBill %></td>
            </tr>
            <tr class="defaultText"><td colspan=4><hr></td></tr>
        </table>
</BODY>
</HTML>
<!-- End: Checkout.jsp -->