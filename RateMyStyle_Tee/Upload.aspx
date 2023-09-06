<%@ Page Language="C#"%>
<%@ Import Namespace="System.Data.OleDb" %>

<script runat="server">

          protected void btnSubmit_Click(Object s, EventArgs e)
          {
             
              Msg.InnerHtml = "";
              String ITM = txtItem.Value;
              String COL = txtColour.Value;
              String SHP = txtShop.Value;
              String PRI = txtPrice.Value;
              String fileName = PhotoUpload.FileName;
              String cs = "Provider=Microsoft.ACE.OLEDB.12.0;" +
                          "Data Source=" + Server.MapPath("RateStyle.accdb") + ";";
              OleDbConnection cn = new OleDbConnection(cs);
              {
                  cn.Open();
                  OleDbCommand Reg = new OleDbCommand("INSERT INTO Garments( [Item], [Colour], [Shop], [Price], [Image]) VALUES (@Item, @Colour, @Shop, @Price, @Image)", cn);
                  Reg.Parameters.AddWithValue("@Item", ITM);
                  Reg.Parameters.AddWithValue("@Colour", COL);
                  Reg.Parameters.AddWithValue("@Shop", SHP);
                  Reg.Parameters.AddWithValue("@Price", PRI);
                  Reg.Parameters.AddWithValue("@Image", fileName);
                  Reg.ExecuteNonQuery();
                  Msg.InnerText = "Uploaded Successfully";
                  cn.Close();

                  if(PhotoUpload.HasFile)
                  {

                      Reg.Parameters.AddWithValue("@Images", fileName);
                      PhotoUpload.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                      Response.Redirect(Request.Url.AbsoluteUri);


                  }



              }


          }

         
          void btnRate_Click(Object x, EventArgs e)
          {
              RateMyStyle();
          }
          void RateMyStyle()
          {
              Response.Redirect("Styles.aspx");
          }

</script>

<html>
<head runat="server"><title>Rate My Style</title></head>
<body bgcolor ="palevioletred">
    <center>
    <h1 style="color:#ffffff"><font size="50">rate my style.</font></h1>
        <form id="form1" runat="server">
           <div id="MyProfile" runat="server">
            
            <h2 style="color:#ffffff"><font size="20">upload an image.</font></h2>
              <a href="Styles.aspx">View Styles</a>
               <i><p style="color:#ffffff">all fields are mandatory</p></i>
             <p style="color:#ffffff">Item : <input id="txtItem" type="text" runat="server" />
    Colour :<input id="txtColour" type="text" runat="server">
                 Shop :<input id="txtShop" type="text" runat="server" />
     Price(£) :<input id="txtPrice" type="text" runat="server"/></p> 
                  <p style="color:#ffffff"><asp:FileUpload runat="server" ID="PhotoUpload" /></p><br />
            <br />
             <p id="Msg" runat="server" style="color:#ffffff"></p>
            
          
                <input id="btnSubmit" type="submit" value="Submit" runat="server" onserverclick="btnSubmit_Click"/>
           
        </div>     
    </form>
  </center>   
</body>
</html>