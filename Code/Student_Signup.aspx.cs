using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Communique
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < ddlTechnology.Items.Count; i++)
            {
                ddlTechnology.Items[i].Attributes.Add("style", "background-color:#132f00");

            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
            string ins = "INSERT INTO Student (StudentEnrollment,StudentFirstname,StudentLastname,StudentProjectname,StudentTechnology,StudentPassword,StudentEmail) VALUES ('" + txtEnrollment.Text + "','" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtProjectName.Text + "','" + ddlTechnology.SelectedValue.ToString() + "','" + txtConfirmPassword.Text + "','" + txtEmail.Text + "')";
            //string staticTest = "INSERT INTO (StudentEnrollment, StudentFirstname, StudentLastname, StudentProjectname, StudentTechnology,  StudentPassword, StudentEmail) VALUES (176620307003, 'Antoniyo', 'Lawery', 'Polarcornation', 'Python', '123456789', Anton@hotmail.com);";
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand(ins, conn);
            //SqlDataAdapter go = new SqlDataAdapter();

            conn.Open();
            C.ExecuteNonQuery();
            conn.Close();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Profile sucessfully created.')", true);
            Response.Redirect("Student_Panel");
        }
    }
}