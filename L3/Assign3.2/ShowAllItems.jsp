<!-- Begin: ShowAllItems.jsp -->
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
	    <tr class="tableOddRow">
		<td><INPUT type="checkbox" name="penSelect"></INPUT></td>
		<td>101</td>
		<td>Pen</td>
		<td>2.00</td>
		<td>
		    <INPUT type="text" name="penQty" size="3" value="1"></INPUT>
		</td>
	    </tr>
	    <tr class="tableEvenRow">
		<td><INPUT type="checkbox" name="pencilSelect"></INPUT></td>
		<td>102</td>
		<td>Pencil</td>
		<td>1.00</td>
		<td>
		    <INPUT type="text" name="pencilQty" size="3" value="1"></INPUT>
		</td>
	    </tr>
	    <tr class="tableOddRow">
		<td><INPUT type="checkbox" name="eraserSelect"></INPUT></td>
		<td>103</td>
		<td>Eraser</td>
		<td>0.50</td>
		<td>
		    <INPUT type="text" name="eraserQty" size="3" value="1"></INPUT>
		</td>
	    </tr>
	    <tr class="defaultText">
		<td align="center" colspan=5>
		    <INPUT type="submit" name="submit" value="Submit"</INPUT>
		</td>
	    </tr>
	</table>
    </FORM>
</BODY>
</HTML>
<!-- End: ShowAllItems.jsp -->