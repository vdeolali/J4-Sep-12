<!-- Begin: Login.jsp -->
<HTML>
<HEAD>
    <STYLE>
        .defaultText {font-family:Helvetica,Arial; font-size:10pt; color:black;}
    </STYLE>
    <SCRIPT LANGUAGE="JAVASCRIPT">
    function validate()
    {
        if (document.forms.main.username.value == "")
        {
            alert("Username cannot be empty.");
            return false;
        }
        else if (document.forms.main.password.value == "")
        {
            alert("Password cannot be empty.");
            return false;
        }
        else if (document.forms.main.password.value.length <= 3)
        {
            alert("Password must be at least 4 characters.");
            return false;
        }
        return true;
    }
    </SCRIPT>
</HEAD>
<BODY>
    <%
        out.println("<FORM name=\"main\" ACTION=\"ShowAllItems.jsp\">");
        out.println("<TABLE><TR CLASS=\"defaultText\">");
        out.println("<TD>First name:</TD>");
        out.println("<TD><INPUT type=\"text\" name=\"username\"></INPUT></TD>");
        out.println("</TR><TR CLASS=\"defaultText\">");
        out.println("<TD>Last name:</TD>");
        out.println("<TD><INPUT type=\"password\" name=\"password\"></INPUT></TD>");
        out.println("</TR><TR CLASS=\"defaultText\">");
        out.println("<TD COLSPAN=2 ALIGN=\"CENTER\">");
        out.println("<INPUT type=\"submit\" VALUE=\"Submit\"");
        out.println("onclick=\"return validate()\"></INPUT>");
        out.println("</TD></TR></TABLE></FORM>");
%>
</BODY>
</HTML>
<!-- End: Login.jsp -->