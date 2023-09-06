<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">


    protected void btnLogin_Click(Object s, EventArgs e)
    {



        txtMain.InnerHtml = "";
        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                    "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);
        cn.Open();
        OleDbCommand cmd = new OleDbCommand();
        cmd.Connection = cn;
        cmd.CommandText = "SELECT * FROM [Registration] WHERE Username='" + txtUsername.Value + "' AND Password='" + txtPassword.Value + "'";
        OleDbDataReader r= cmd.ExecuteReader();
        int count = 0;
        while (r.Read())
        {
            Session["user"] = r["ID"];
            count = count + 1;
        }
        if (count == 1)
        {

            txtMain.InnerText = "Username and Password is correct";
            Styles();

        }
        else if (count > 1)
        {
            txtMain.InnerText = "Duplicate Username and Password";
            Styles();
        }
        else
        {
            txtMain.InnerText = "Username and/or Password is not correct. Please re-enter your details to try again.";
            Clear();
        }

        cn.Close();

    }
    void btnRegister_Click(Object s, EventArgs e)
    {
        Begin();
    }
    void Begin()
    {
        Response.Redirect("Registration.aspx");
    }
    void Styles()
    {
        HtmlMeta meta = new HtmlMeta();
        meta.HttpEquiv = "Refresh";
        meta.Content = "1;url=Styles.aspx";
        this.Page.Controls.Add(meta);
    }
    void Clear()
    {
        txtUsername.Value = txtPassword.Value = "";
    }

    </script>

<html>
    <head runat="server">
    
    <title>Rate My Style</title>
</head>
<body bgcolor="palevioletred"> 
    <center>
    <h1 style="color:#ffffff"><font size="50">rate my style.</font></h1>
  
    <div id="Login" runat="server">
    <form id="form1" runat="server">
    <p style="color:#ffffff"><font size="4.5"> Login:</font></p><input id="txtUsername" type="text" runat="server" placeholder="Username" />
     <p><input id="txtPassword" type="password" runat="server"  placeholder="Password"/></p><br />
        <br />
       
        <input id="btnLogin" type="submit" value="Login" runat="server" onserverclick="btnLogin_Click" required/>
        <input id="btnRegister" type="submit" value="Register" runat="server" onserverclick="btnRegister_Click" />
        
    <p id="txtMain" runat="server" style="color:#ffffff"></p><font size="4.5"></font>
    </form>
        </div>
        </center>
</body>
</html>