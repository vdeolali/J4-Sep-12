<!-- Begin: ShowAllItems.jsp -->
<HTML>
<HEAD>
    <STYLE TYPE="text/css">
        .defaultText{font-family:Helvetica,Arial;font-size:10pt;}
        .tableEvenRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#E6E6E6}
        .tableOddRow{font-family:Helvetica,Arial;font-size:9pt;background-color:#FFFFFF}
    </STYLE>
    <SCRIPT LANGUAGE="JAVASCRIPT">
    function validate()
    {
        if (!document.forms.main.penSelect.checked &&
                !document.forms.main.pencilSelect.checked &&
                !document.forms.main.eraserSelect.checked)
        {
            alert("At least one item must be selected");
            return false;
        }
        return true;
    }
    </SCRIPT>
</HEAD>
<BODY>
    <%
        out.println("<FORM name=\"main\" ACTION=\"ThankYou.jsp\">");
        out.println("<table align=\"center\">");
        out.println("<tr class=\"tableEvenRow\">");
        out.println("<td></td> <td>Item #</td>");
        out.println("<td>Item Name</td>");
        out.println("<td>Price</td>");
        out.println("<td>Quantity</td>");
        out.println("</tr>");
        out.println("<tr class=\"tableOddRow\">");
        out.println("<td><INPUT type=\"checkbox\" name=\"penSelect\"</INPUT></td>");
        out.println("<td>101</td>");
        out.println("<td>Pen</td>");
        out.println("<td>2.00</td>");
        out.println("<td><INPUT type=\"text\" name=\"penQty\" size=\"3\" value=\"1\"></INPUT></td>");
        out.println("</tr>");
        out.println("<tr class=\"tableEvenRow\">");
        out.println("<td><INPUT type=\"checkbox\" name=\"pencilSelect\"</INPUT></td>");
        out.println("<td>102</td>");
        out.println("<td>Pencil</td>");
        out.println("<td>1.00</td>");
        out.println("<td>");
        out.println("<INPUT type=\"text\" name=\"pencilQty\" size=\"3\" value=\"1\"></INPUT>");
        out.println("</td>");
        out.println("</tr>");
        out.println("<tr class=\"tableOddRow\">");
        out.println("<td><INPUT type=\"checkbox\" name=\"eraserSelect\"</INPUT></td>");
        out.println("<td>103</td>");
        out.println("<td>Eraser</td>");
        out.println("<td>0.50</td>");
        out.println("<td>");
        out.println("<INPUT type=\"text\" name=\"eraserQty\" size=\"3\" value=\"1\"></INPUT>");
        out.println("</td>");
        out.println("</tr>");
        out.println("<TR CLASS=\"defaultText\">");
        out.println("<TD colspan=2>");
        out.println("<INPUT type=\"submit\" value=\"Submit\" ONCLICK=\"return validate()\"></INPUT>");
        out.println("</TD>");
        out.println("</TR>");
        out.println("</table>");
        out.println("</FORM>");
%>
</BODY>
</HTML>
<!-- End: ShowAllItems.jsp -->
/TD>
