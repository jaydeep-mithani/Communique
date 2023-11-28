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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
        
        public void fillDropDown(string query, string itemColumn, DropDownList ddl)
        {
            if (Session["Adm"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
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
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            fillDropDown("SELECT BatchYear FROM Batch", "BatchYear", ddlBatch);
            fillDropDown("SELECT TechnologyName FROM Technology", "TechnologyName", ddlTechnology);

            for (int i = 0; i < ddlTechnology.Items.Count; i++)
            {
                ddlTechnology.Items[i].Attributes.Add("style", "background-color:#746e02");
            }
            for (int i =0; i<ddlBatch.Items.Count; i++)
            {
                ddlBatch.Items[i].Attributes.Add("style", "background-color:#746e02");
            }

        }

        protected void btnStudent_Click(object sender, EventArgs e)
        {
            try
            {
                string ins = "INSERT INTO Student (StudentEnrollment,StudentFirstname,StudentLastname,StudentProjectname,StudentTechnology,StudentPassword,StudentEmail,StudentGroup,StudentBatch) VALUES ('" + txtEnrollment.Text + "','" + txtFirstName.Text.ToLower() + "','" + txtLastName.Text.ToLower() + "','" + txtProjectName.Text.ToLower() + "','" + ddlTechnology.Text + "','" + txtConfirmPassword.Text + "','" + txtEmail.Text.ToLower() + "','" + txtGroupNo.Text.ToLower() + "','" + Convert.ToInt32(ddlBatch.Text) + "')";

                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(ins, conn);

                conn.Open();
                C.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('New student inserted to the database.')", true);

                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtGroupNo.Text = "";
                txtProjectName.Text = "";
                txtEmail.Text = "";
                txtEnrollment.Text = "";
                ddlTechnology.SelectedIndex = ddlTechnology.Items.IndexOf(ddlTechnology.Items.FindByText("Android"));
                ddlBatch.SelectedIndex = ddlBatch.Items.IndexOf(ddlBatch.Items.FindByText("2017"));
            }
            //catch (SqlException sqlEx)
            //{
            //    //Response.Write("<script>alert('Server error! Make sure the enrollment number doesn't already exist!')</script>");
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Server error'" + sqlEx.Message + "');", true);
            //}
            catch
            {
                //Response.Write("<script>alert('')</script>");
                ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Inserction Failed! Something went wrong during the process!');", true);
            }
        }
    }
}