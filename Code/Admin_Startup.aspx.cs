using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Communique
{
    public partial class Startup : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
        public Int32 getCount(string query)
        {
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand(query, conn);
            conn.Open();
            Int32 count = (Int32)C.ExecuteScalar();
            conn.Close();
            return count;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adm"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                hndStudents.Value = Convert.ToString(getCount("SELECT COUNT(StudentEnrollment) FROM Student"));
                hndFaculties.Value = Convert.ToString(getCount("SELECT COUNT(FacultyEmail) FROM Faculty"));
            }
        }
    }
}