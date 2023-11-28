using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Communique
{
    public partial class Admin_Technology_Delete : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adm"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                String insertTech = "INSERT INTO Technology (TechnologyName, TechnologyInitial) VALUES ('" + txtTechnologyName.Text + "', '" + txtTechnologyInitial.Text.ToLower() + "')";
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(insertTech, conn);
                conn.Open();
                C.ExecuteNonQuery();
                conn.Close();

                string msg = txtTechnologyName.Text + " added to technologies!";
                Response.Write("<script>alert('" + msg + "')</script>");
            }
            catch
            {
                Response.Write("<script>alert('Something went wrong. Please retry in a while!')</script>");
            }
        }
    }
}