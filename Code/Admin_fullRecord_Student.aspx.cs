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
    public partial class Admin_fullRecord_Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adm"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                string sltStudent = "SELECT * FROM Student";
                string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";

                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(sltStudent, conn);
                SqlDataAdapter adpt = new SqlDataAdapter(sltStudent, conn);
                DataTable tbl = new DataTable();

                conn.Open();
                adpt.Fill(tbl);
                gvStudentShow.DataSource = tbl;
                gvStudentShow.DataBind();
            }
        }

        protected void gvStudentShow_Load(object sender, EventArgs e)
        {

        }
    }
}