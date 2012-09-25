<!-- Begin: SelectMore.jsp -->
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
    <SCRIPT>
    function handleCheckout(obj)
    {
        if (obj.value == "Update")
        {
            document.forms.main.action="SelectMore.jsp";
        }
        else if (obj.value == "Checkout")
        {
            document.forms.main.action="Checkout.jsp";
        }
        document.forms.main.submit();
    }
    </SCRIPT>
</HEAD>
<BODY>
    <FORM name="main" >
        <table align="center">
            <tr class="tableEvenRow">
                <td></td>
                <td>Item #</td>
                <td>Item Name</td>
                <td>Price</td>
                <td>Quantity</td>
            </tr>
            <tr class="tableOddRow">
                <td>
                    <INPUT type="checkbox" name="penSelect"
                            <%= (bPenSelect? "CHECKED" : "") %>/>
                </td>
                <td>101</td>
                <td>Pen</td>
                <td>2.00</td>
                <td>
                    <INPUT type="text" name="penQty" size="3"
                            value="<%= penQty %>"></INPUT>
                </td>
            </tr>
            <tr class="tableEvenRow">
                <td>
                    <INPUT type="checkbox"
                            name="pencilSelect" <%= (bPencilSelect? "CHECKED" : "") %>/>
                </td>
                <td>102</td>
                <td>Pencil</td>
                <td>1.00</td>
                <td>
                    <INPUT type="text" name="pencilQty" size="3" value="<%= pencilQty %>">
            </tr>
            <tr class="tableOddRow">
                <td>
                    <INPUT type="checkbox"
                            name="eraserSelect" <%= (bEraserSelect? "CHECKED" : "") %>/>
                </td>
                <td>103</td>
                <td>Eraser</td>
                <td>0.50</td>
                <td>
                    <INPUT type="text" name="eraserQty" size="3" value="<%= eraserQty %>">
                </td>
            </tr>
            <tr class="defaultText"><td colspan=5><hr></td></tr>
            <tr class="defaultText">
                <td colspan=5 align="center"> Total Bill: <%= totalBill %></td>
            </tr>
            <tr class="defaultText"><td colspan=5><hr></td></tr>
            <tr class="defaultText">
                <td align="center" colspan=3>
                    <INPUT type="button" name="update" value="Update"
                            onclick="handleCheckout(this)">
                </td>
                <td align="center" colspan=3>
                    <INPUT type="button" name="checkout" value="Checkout"
                            onclick="handleCheckout(this)">
                </td>
            </tr>
        </table>
    </FORM>
</BODY>
</HTML>
<!-- End: SelectMore.jsp -->