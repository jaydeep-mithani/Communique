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
    public partial class Student_Panel_History : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Enr"] == null)
            {
                Response.Redirect("Student_Login.aspx");
            }
            else
            {
                string enrol = Request.Cookies["enrollment"].Value.ToString();
                string getHistory = "SELECT Agree, DU, Reason FROM DataUpdate WHERE StudentEnrollmentNo='" + enrol + "'";

                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(getHistory, conn);
                SqlDataAdapter adpt = new SqlDataAdapter(getHistory, conn);
                DataTable tbl = new DataTable();

                conn.Open();
                adpt.Fill(tbl);
                gvHistory.DataSource = tbl;
                gvHistory.DataBind();
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Server.Transfer("Student_Panel_Home.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("Enr");
            Response.Redirect("Student_Login.aspx");
            Response.Cookies["enrollment"].Expires = DateTime.Now.AddDays(-1);
        }

        protected void btnViewInfo_Click(object sender, EventArgs e)
        {
            Server.Transfer("Student_Panel_Information.aspx");
        }
    }
}