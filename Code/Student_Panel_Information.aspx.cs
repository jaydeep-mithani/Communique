using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Communique
{
    public partial class Student_Panel_Information : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Enr"] == null)
            {
                Response.Redirect("Student_Login.aspx");
            }
            else
            {
                string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
                string enrol = Request.Cookies["enrollment"].Value.ToString();

                //Queries
                string getTech = "SELECT StudentTechnology FROM Student WHERE StudentEnrollment='" + enrol + "'";
                string getFirstName = "SELECT StudentFirstname FROM Student WHERE StudentEnrollment='" + enrol + "'";
                string getLastName = "SELECT StudentLastname FROM Student WHERE StudentEnrollment='" + enrol + "'";
                string getProject = "SELECT StudentProjectname FROM Student WHERE StudentEnrollment='" + enrol + "'";
                string getEmail = "SELECT StudentEmail FROM Student WHERE StudentEnrollment='" + enrol + "'";
                string getGroupNo = "SELECT StudentGroup FROM Student WHERE StudentEnrollment='" + enrol + "'";
                string getBatch = "SELECT StudentBatch FROM Student WHERE StudentEnrollment='" + enrol + "'";
                //string getGuideFirstName = "SELECT FacultyFirstname FROM Faculty WHERE FacultyTechleader='" + getTech + "'";
                //string getGuideLastName = "SELECT FacultyLastname FROM Faculty WHERE FacultyTechleader='" + getTech + "'";

                SqlConnection conn = new SqlConnection(cs);

                //Retrival
                lblShowEnrollment.Text = enrol;
                SqlCommand C = new SqlCommand(getTech,conn);
                conn.Open();
                lblShowTech.Text = (string)C.ExecuteScalar();
                C.CommandText = getFirstName;
                string sfName = (string)C.ExecuteScalar();
                C.CommandText = getLastName;
                lblShowName.Text = sfName + " " + (string)C.ExecuteScalar();
                C.CommandText = getProject;
                lblShowProjectName.Text = (string)C.ExecuteScalar();
                C.CommandText = getEmail;
                lblShowEmail.Text = (string)C.ExecuteScalar();
                C.CommandText = getGroupNo;
                lblShowGroup.Text = (string)C.ExecuteScalar();
                C.CommandText = getBatch;
                Int32 year = (Int32)C.ExecuteScalar();
                lblShowBatch.Text = Convert.ToString(year);
                C.CommandText = "SELECT FacultyFirstname FROM Faculty WHERE FacultyTechleader='" + lblShowTech.Text + "'"; //getGuideFirstName;
                string gfName = (string)C.ExecuteScalar();
                C.CommandText = "SELECT FacultyLastname FROM Faculty WHERE FacultyTechleader='" + lblShowTech.Text + "'"; //getGuideLastName;
                lblShowGuide.Text = gfName + " " + (string)C.ExecuteScalar();
                C.Dispose();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("Enr");
            Response.Redirect("Student_Login.aspx");
            Response.Cookies["enrollment"].Expires = DateTime.Now.AddDays(-1);
        }

        protected void btnHistory_Click(object sender, EventArgs e)
        {
            Server.Transfer("Student_Panel_History.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Server.Transfer("Student_Panel_Home.aspx");
        }
    }
}