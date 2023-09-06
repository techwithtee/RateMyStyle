<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">
    protected void btnLogin_Click(Object s, EventArgs e)
    {
        Login();
    }
    void Login()
    {
        Response.Redirect("Login.aspx");
    }

</script>

<html>
<head runat="server">
    <title>Rate My Style</title>
</head>

<body bgcolor="palevioletred">
    <center>
        <h1 style="color: #ffffff"><font size="50">rate my style.</font></h1>
        <form id="form1" runat="server">

            <div id="Home" runat="server">
                <p style="color: #ffffff"><font size="4.5">share and rate the latest fashion trends.</font></p>
                <br />
                <image src=" gracey (2).jpg" width="425" height="750" />
                <image src=" nathan.jpg" width="450" height="750" />


                <br />
                <input id="btnLogin" type="submit" value="Login" runat="server" onserverclick="btnLogin_Click" />

            </div>

        </form>

    </center>
</body>
</html>
