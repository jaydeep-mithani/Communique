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
    public partial class Admin_Faculy_Insert : System.Web.UI.Page
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
                fillDropDown("SELECT TechnologyName FROM Technology", "TechnologyName", ddlTechnology);

                for (int i = 0; i < ddlTechnology.Items.Count; i++)
                    ddlTechnology.Items[i].Attributes.Add("style", "background-color:#746e02");

                Page.Form.DefaultButton = btnFaculty.UniqueID;
                txtFirstName.Focus();
            }
        }

        protected void btnFaculty_Click(object sender, EventArgs e)
        {
            try
            {
                string dataInsert = "INSERT INTO Faculty (FacultyEmail, FacultyLastname, FacultyTechleader, FacultyPassword, FacultyFirstname)" +
                                    "VALUES ('" + txtEmail.Text.ToLower() + "','" + txtLastName.Text.ToLower() + "', '" + ddlTechnology.Text + "', '" + txtConfirmPassword.Text + "', '" + txtFirstName.Text.ToLower() + "')";
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(dataInsert, conn);
                conn.Open();
                C.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('New faculty added successfully!')", true);
                
                txtEmail.Text = "";
                txtFirstName.Text = "";
                txtLastName.Text = "";
                ddlTechnology.SelectedIndex = ddlTechnology.Items.IndexOf(ddlTechnology.Items.FindByText("Android"));
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Connection or server error! Please check the data and try again.')", true);
            }
        }
    }
}