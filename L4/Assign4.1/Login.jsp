<!-- Begin: Login.jsp -->

<%!
String getErrorMsg(String state){
 String ErrorMsg= "Incorrect Username Password Combination";
 if (state != null &&  !state.trim().equals("")){
    if (state.equals("error")){
      System.out.println ("Seeing this?");
      return(ErrorMsg);
    }
    return (" ");
 }
 return ("");
}
%>
<HTML>
<HEAD>
<STYLE>
.defaultText {font-family:Helvetica,Arial; font-size:10pt; color:black;}
.errorText {font-family:Helvetica,Arial; font-size:10pt; color:red;}
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
<FORM name="main" ACTION="ProcessLogin.jsp" METHOD="POST">
<TABLE>
<TR CLASS="errorText">
<TD> <%= getErrorMsg(request.getParameter("state"))%> </TD>
</TR>
<TR CLASS="defaultText">
<BR />
<TD>Username:</TD>
<TD><INPUT type="text" name="username"></INPUT></TD>
</TR>
<TR CLASS="defaultText">
<TD>Password:</TD>
<TD><INPUT type="password" name="password"></INPUT></TD>
</TR>
<TR CLASS="defaultText">
<TD COLSPAN=2 ALIGN="CENTER">
<INPUT type="submit" VALUE="Submit" onclick="return validate()"></INPUT>
</TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>
<!-- End: Login.jsp -->