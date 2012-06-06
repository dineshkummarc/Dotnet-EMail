<%@ Page Language="VB" %>
<%@ Import Namespace="System.Web.Mail" %>
<script runat="server">    

   Sub btnSubmit_Click(sender as object, e as EventArgs)

		Dim objEmail as New MailMessage()
		objEmail.To = txtTo.Text
		objEmail.From = txtFrom.Text
		objEmail.Cc = txtCc.Text
		objEmail.Subject = "Test Email"
		objEmail.Body = txtName.Text & ", " &txtComments.Text
		objEmail.Priority = MailPriority.High

		// Make sure you have appropriate replying permissions from your local system
                //SmtpMail.SmtpServer = "localhost"

		try
			SmtpMail.Send(EMail)
			Response.Write(Your E-mail has been sent sucessfully - Thank You)
		
		catch exc as Exception
			Response.Write("Send failure: " + exc.ToString())
		End Try
    End Sub
</script>

<html>
	<head>
	<title>E-mail and ASP.NET: Part 1 - Visual Basic .NET</title>
	</head>
	<body>
		<form runat="server">
                <div align="left">
                <table border="0" width="544">
					<tr>
						<td valign="top"><font face="Verdana" size="2">Name:</font></td>
						<td height="24">   <asp:TextBox runat="server" Height="25px" Width="370px" ID="txtName"></asp:TextBox>
						<br>
						<asp:RequiredFieldValidator ID = "req1" ControlToValidate = "txtName" Runat = "server" ErrorMessage = "Please enter your name"></asp:RequiredFieldValidator></td>
					</tr>
					<tr>
						<td valign="top"><font face="Verdana" size="2">From</font></td>
						<td height="24"> <asp:TextBox runat="server" Height="22px" Width="368px" ID="txtFrom"></asp:TextBox>
						<br>
						<asp:RegularExpressionValidator ID = "reg1" ControlToValidate = "txtFrom" Runat = "server" ErrorMessage = "Invalid Email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>&nbsp;<asp:RequiredFieldValidator ID = "req3" ControlToValidate = "txtFrom" Runat = "server" ErrorMessage = "Please enter your E-mail" ></asp:RequiredFieldValidator></td>
					</tr>
					<tr>
						<td valign="top"><font face="Verdana" size="2">To</font></td>
						<td height="24" valign="top"> 
						<asp:TextBox runat="server" Height="22px" Width="368px" ID="txtTo"></asp:TextBox>
						<br>
						<asp:RegularExpressionValidator ID = "reg2" ControlToValidate = "txtTo" Runat = "server" ErrorMessage = "Invalid Email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
						&nbsp;<asp:RequiredFieldValidator ID = "req4" ControlToValidate = "txtTo" Runat = "server" ErrorMessage = "Please enter recipients name" ></asp:RequiredFieldValidator></td>
					</tr>
					<tr>
						<td valign="top"><font face="Verdana" size="2">Cc</font></td>
						<td height="24" valign="top"> 
						<asp:TextBox runat="server" Height="22px" Width="368px" ID="txtCc"></asp:TextBox>
						<br>
						<asp:RegularExpressionValidator ID = "reg3" ControlToValidate = "txtCc" Runat = "server" ErrorMessage = "Invalid Email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
						</td>
					</tr>
					<tr>
						<td valign="top"><font face="Verdana" size="2">Comments:</font></td>
						<td height="112"> <asp:TextBox runat="server" Height="110px" TextMode="MultiLine" Width="368px" ID="txtComments"></asp:TextBox>
						<br>
						<asp:RequiredFieldValidator ID = "req2" ControlToValidate = "txtComments" Runat = "server" ErrorMessage = "Please enter your comments"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td colspan="2" valign="top" height="30">
						<p align="center">


			<asp:Button Runat = server ID = btnSubmit OnClick = btnSubmit_Click Text = "Submit"></asp:Button>
						&nbsp;<input type = "reset" runat = "server" value = "Clear"></td>
					</tr>
					</table>
				<p align="center">&nbsp;</div>
				<p align="left"><font face="Verdana"><font size="1">This page is a test site for the 
				article &quot;Email and ASP.NET&quot;</font></font></p>
				<p>&nbsp;</p>
				<p><br>


			<!-- Insert content here -->
				</p>
		</form>
	</body>
</html>