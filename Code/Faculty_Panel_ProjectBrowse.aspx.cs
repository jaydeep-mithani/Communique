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
    public partial class Faculty_Panel_ProjectBrowse : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Em"] == null)
            {
                Response.Redirect("Faculty_Login.aspx");
            }

            //string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";

            string em = Request.Cookies["email"].Value.ToString();
            string getTech = "SELECT FacultyTechleader FROM Faculty WHERE FacultyEmail='" + em + "';";

            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand(getTech, conn);

            conn.Open();
            string tech = (string)C.ExecuteScalar();
            conn.Close();

            string sltStudent = "Select DISTINCT StudentProjectname from Student where StudentTechnology='" + tech + "';";
            SqlCommand start = new SqlCommand(sltStudent, conn);
            SqlDataAdapter adpt = new SqlDataAdapter(sltStudent, conn);
            DataTable tbl = new DataTable();


            conn.Open();
            adpt.Fill(tbl);
            viewProjects.DataSource = tbl;
            viewProjects.DataBind();
            //gvProjectShow.DataSource = tbl;
            //gvProjectShow.DataBind();
            //.DataSource = tbl;
            //.DataBind();
            conn.Close();
        }

        protected void btnUpdates_Click(object sender, EventArgs e)
        {
            Server.Transfer("Faculty_Panel_Home.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("Em");
            Response.Redirect("Faculty_Login.aspx");
            Response.Cookies["email"].Expires = DateTime.Now.AddDays(-1);
        }

        protected void viewProjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Fetch Projectname
            string projectName = viewProjects.SelectedRow.Cells[0].Text;

            //Fill project details to invisible gridview
                    //string cs = @"Data Source = DESKTOP - MS10Q25\JERRYSSERVER; Initial Catalog = Communique; Integrated Security = True";
            string sltStudent = "Select StudentEnrollment, StudentFirstname, StudentLastname, StudentEmail, StudentGroup, StudentBatch from Student where StudentProjectname='" + projectName + "';";
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand start = new SqlCommand(sltStudent, conn);
            SqlDataAdapter adpt = new SqlDataAdapter(sltStudent, conn);
            DataTable tbl = new DataTable();

            conn.Open();
            adpt.Fill(tbl);
            projectDetails.DataSource = tbl;
            projectDetails.DataBind();
            conn.Close();

            //Show the invisible gridview
            projectDetails.Visible = true;
        }

        protected void viewProjects_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}