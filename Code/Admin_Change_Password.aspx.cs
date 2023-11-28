using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Communique
{
    public partial class Change_Password_Admin : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adm"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            try
            {
                string getPassword = "SELECT AdminPassword FROM Admin WHERE AdminUsername='" + txtUsername.Text + "'";
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand P = new SqlCommand(getPassword, conn);
                conn.Open();
                string password = (string)P.ExecuteScalar();
                conn.Close();

                try
                {
                    if (txtOldPassword.Text == password)
                    {
                        string updatePassword = "UPDATE Admin SET AdminPassword='" + txtConfirmPassword.Text + "' WHERE AdminUsername='" + txtUsername.Text + "'";
                        SqlCommand C = new SqlCommand(updatePassword, conn);
                        conn.Open();
                        C.ExecuteNonQuery();
                        conn.Close();
                        Response.Write("<script>alert('Password Sucessfully changed!')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Old password does not match!')</script>");
                    }
                }
                catch
                {

                    Response.Write("<script>alert('Incorrect Username or password!')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Username not Found!')</script>");
            }
        }
    }
}