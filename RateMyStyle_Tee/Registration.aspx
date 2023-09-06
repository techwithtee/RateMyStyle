<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">


    protected void btnRegister_Click(Object s, EventArgs e)
    {


        P1.InnerHtml = "";
        Msg.InnerHtml = "";
        String FN = txtFirstName.Value;
        String LN = txtLastName.Value;
        String EM = txtEmail.Value;
        String US = txtUsername.Value;
        String PW = txtPassword.Value;
        String CP = txtConfirmPassword.Value;
        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                    "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);
        {

            OleDbCommand cmd = new OleDbCommand("INSERT INTO Registration( [FirstName], [LastName], [Email], [Username], [Password]) VALUES (@FirstName, @LastName, @Email, @Username, @Password)", cn);
            cmd.Parameters.AddWithValue("@FirstName", FN);
            cmd.Parameters.AddWithValue("@LastName", LN);
            cmd.Parameters.AddWithValue("@Email", EM);
            if (US == "" || PW == "" || CP == "")
            {
                Msg.InnerText = "You need to enter the mandatory field(s).";
                cn.Close();
            }
            else
            {
                cmd.Parameters.AddWithValue("@Username", US);
                if (PW == CP)
                {
                    cmd.Parameters.AddWithValue("@Password", PW);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    Msg.InnerText = "Registration Complete";
                    cn.Close();
                    Login();
              
                }
                else
                {

                    Msg.InnerText = "Your Passwords do not match.";
                    cn.Close();
                }

            }

        }

    }

     void btnGoBack_Click(Object s, EventArgs e)
    {
        GoBack();
    }
    void GoBack()
    {
        Response.Redirect("Login.aspx");
    }
    void Login()
    {
        HtmlMeta meta = new HtmlMeta();
        meta.HttpEquiv = "Refresh";
        meta.Content = "3;url=Login.aspx";
        this.Page.Controls.Add(meta);
        P1.InnerText = "You will now be redirected to sign in";
    }


    </script>
<html>
    <head runat="server">
    
    <title>Rate My Style</title>
</head>
<body bgcolor ="palevioletred"> 
    <center>
    <h1 style="color:#ffffff"><font size="50">rate my style.</font></h1>
    <div id="Registration" runat="server">
    <form id="form1" runat="server">
        <p style="color:#ffffff"><font size="4.5"> Register:</font></p>
        <i><p style="color:#ffffff">* fields are mandatory</p></i>
    <p style="color:#ffffff">First Name:</p> <input id="txtFirstName" type="text" runat="server" />
     <p style="color:#ffffff">Last Name:</p><input id="txtLastName" type="text" runat="server" />
     <p style="color:#ffffff">Email Address:</p><input id="txtEmail" type="text" runat="server" />
    <p style="color:#ffffff"> * Username:</p><input id="txtUsername" type="text" runat="server" /> 
     <p style="color:#ffffff">* Password:</p><input id="txtPassword" type="password" runat="server" /> 
    <p style="color:#ffffff"> * Confirm Password:</p><input id="txtConfirmPassword" type="password" runat="server" /><br />
        <br />
        <p id="Msg" runat="server" style="color:#ffffff"></p>
        <p id="P1" runat="server" style="color:#ffffff"></p>
        
        <input id="btnGoBack" type="submit" value="Go Back" runat="server" onserverclick="btnGoBack_Click" />
        <input id="btnRegister" type="submit" value="Register" runat="server" onserverclick="btnRegister_Click" />
        
            
        
    </form>
        </div>
        </center>
</body>
</html>
