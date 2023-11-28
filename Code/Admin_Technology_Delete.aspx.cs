using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Communique
{
    public partial class Admin_Technology_Delete1 : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
        public void fillDropDown(string query, string itemColumn, DropDownList ddl)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    SqlConnection conn = new SqlConnection(cs);
                    SqlCommand com = new SqlCommand(query, conn);
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    ddl.DataTextField = ds.Tables[0].Columns[itemColumn].ToString();
                    ddl.DataValueField = ds.Tables[0].Columns[itemColumn].ToString();
                    ddl.DataSource = ds.Tables[0];
                    ddl.DataBind();
                    conn.Close();
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Error connecting to server');", true);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adm"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                fillDropDown("SELECT TechnologyName FROM Technology", "TechnologyName", ddlTech);

                for (int i = 0; i < ddlTech.Items.Count; i++)
                {
                    ddlTech.Items[i].Attributes.Add("style", "background-color:#746e02");
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            string msg = ddlTech.Text + " was successfully removed!";

            try
            {
                string deleteTech = "DELETE FROM Technology WHERE TechnologyName='" + ddlTech.Text + "'";
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(deleteTech, conn);
                conn.Open();
                C.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Hello')</script>");
                Response.Redirect("Admin_Technology_Delete.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Connection failed! Please try again later!')</script>");
            }
        }
    }
}