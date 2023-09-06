<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script runat="server">

    String GID;
    String RID;
    void Page_Load()
    {
        GID = Request.QueryString["GID"];
        RID = Session["user"].ToString();
    }

    void Page_LoadComplete()
    {
        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
               "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);
        OleDbCommand cmd;
        OleDbDataReader r;
        
        String sql = "SELECT * FROM Garments WHERE ID=" + GID;
        cmd = new OleDbCommand(sql, cn);

        cn.Open();
        r = cmd.ExecuteReader();
        if (r.Read())
        {
            parItem.InnerText = "Item: " +  r["Item"].ToString();
            parColour.InnerText = "Colour: " + r["Colour"].ToString();
            parShop.InnerText = "Shop: " + r["Shop"].ToString();
            parPrice.InnerText = "£" + r["Price"].ToString();
            parImage.InnerHtml = "<img src='Images/" + r["Image"].ToString() + "' width='425' height='750' />";

        }
        cn.Close();

        sql = "SELECT * FROM Rating WHERE GID=" + GID + "AND RID=" + RID;
        cmd = new OleDbCommand(sql, cn);

        cn.Open();
        r = cmd.ExecuteReader();
        if (r.Read())
        {
            parRate.InnerText = "You rated this " + r["Rate"].ToString() + "/5";

        }
        else{
            parRate.InnerText = "You have not rated this.";
        }
        cn.Close();
    }

    void star1_Click(Object s, EventArgs e)
    {

        int rating = 1;

        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                          "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);

        cn.Open();
        OleDbCommand cmd = new OleDbCommand("INSERT INTO Rating ([Rate], [GID], [RID]) VALUES (@Rate, @GID, @RID);", cn);
        cmd.Parameters.AddWithValue("@Rate", rating);
        cmd.Parameters.AddWithValue("@GID", GID);
        cmd.Parameters.AddWithValue("@RID", RID);
        cmd.ExecuteNonQuery();
        cn.Close();


    }

    void star2_Click(Object s, EventArgs e)
    {

        int rating = 2;

        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                          "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);

        cn.Open();
        OleDbCommand cmd = new OleDbCommand("INSERT INTO Rating ([Rate], [GID], [RID]) VALUES (@Rate, @GID, @RID);", cn);
        cmd.Parameters.AddWithValue("@Rate", rating);
        cmd.Parameters.AddWithValue("@GID", GID);
        cmd.Parameters.AddWithValue("@RID", RID);
        cmd.ExecuteNonQuery();
        cn.Close();


    }

    void star3_Click(Object s, EventArgs e)
    {

        int rating = 3;

        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                          "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);

        cn.Open();
        OleDbCommand cmd = new OleDbCommand("INSERT INTO Rating ([Rate], [GID], [RID]) VALUES (@Rate, @GID, @RID);", cn);
        cmd.Parameters.AddWithValue("@Rate", rating);
        cmd.Parameters.AddWithValue("@GID", GID);
        cmd.Parameters.AddWithValue("@RID", RID);
        cmd.ExecuteNonQuery();
        cn.Close();


    }

    void star4_Click(Object s, EventArgs e)
    {

        int rating = 4;

        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                          "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);

        cn.Open();
        OleDbCommand cmd = new OleDbCommand("INSERT INTO Rating ([Rate], [GID], [RID]) VALUES (@Rate, @GID, @RID);", cn);
        cmd.Parameters.AddWithValue("@Rate", rating);
        cmd.Parameters.AddWithValue("@GID", GID);
        cmd.Parameters.AddWithValue("@RID", RID);
        cmd.ExecuteNonQuery();
        cn.Close();


    }

    void star5_Click(Object s, EventArgs e)
    {

        int rating = 5;

        String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                          "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
        OleDbConnection cn = new OleDbConnection(cs);

        cn.Open();
        OleDbCommand cmd = new OleDbCommand("INSERT INTO Rating ([Rate], [GID], [RID]) VALUES (@Rate, @GID, @RID);", cn);
        cmd.Parameters.AddWithValue("@Rate", rating);
        cmd.Parameters.AddWithValue("@GID", GID);
        cmd.Parameters.AddWithValue("@RID", RID);
        cmd.ExecuteNonQuery();
        cn.Close();


    }


</script>

<html>
  <head><title>Rate My Style</title></head>  
  <body bgcolor="palevioletred">
      <center>
      <h1 style="color:#ffffff"><font size="50">rate my style.</font></h1>
    <form runat="server">
             
        <p id="parItem" runat="server" style="color:#ffffff" ></p> 
        <p id="parColour" runat="server" style="color:#ffffff" ></p>
        <p id="parShop" runat="server" style="color:#ffffff" ></p>
        <p id="parPrice" runat="server" style="color:#ffffff" ></p>
         
        <p><b><i><font size="4.5">click on a button to rate this style out of 5.</font></i></b></p>    
        <input id="star1" type="submit" value="1" runat="server" onserverclick="star1_Click" />
        <input id="star2" type="submit" value="2" runat="server" onserverclick="star2_Click" />
        <input id="star3" type="submit" value="3" runat="server" onserverclick="star3_Click" />
        <input id="star4" type="submit" value="4" runat="server" onserverclick="star4_Click" />
        <input id="star5" type="submit" value="5" runat="server" onserverclick="star5_Click" />
        <i><p id="parRate" runat="server"></p></i>
   
        <p id="parImage" runat="server"></p> 
        <a href="Styles.aspx">Back to Garments</a>
     
    </form>

      </center>
  </body>    
</html>
