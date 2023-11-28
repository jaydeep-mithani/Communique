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
    public partial class Admin_Student_Delete : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
        public int getCount(string query)
        {
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand(query, conn);
            conn.Open();
            int count = C.ExecuteNonQuery();
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
                Page.Form.DefaultButton = btnContinue.UniqueID;
                txtEnrollment.Focus();
            }
        }

        public string fetchScaler(string query)
        {
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            SqlCommand C = new SqlCommand(query, conn);
            string val = (string)C.ExecuteScalar();
            conn.Close();
            return val;
        }
        public Int32 fetchScalerInt(string query)
        {
            SqlConnection conn = new SqlConnection(cs);
            conn.Open();
            SqlCommand C = new SqlCommand(query, conn);
            Int32 val = (Int32)C.ExecuteScalar();
            conn.Close();
            return val;
        }
        protected void btnContinue_Click(object sender, EventArgs e)
        {
            try
            {
                //Page.Form.DefaultButton = btnStudentDelete.UniqueID;
                
                lblEmail.Visible = true;
                lblFName.Visible = true;
                lblLName.Visible = true;
                lblPassword.Visible = true;
                lblProjectName.Visible = true;
                lblTechnology.Visible = true;
                lblGroup.Visible = true;
                lblBatch.Visible = true;
                txtEmail.Visible = true;
                txtFName.Visible = true;
                txtLName.Visible = true;
                txtPassword.Visible = true;
                txtProjectName.Visible = true;
                txtGroup.Visible = true;
                txtBatch.Visible = true;
                txtTech.Visible = true;
                btnStudentDelete.Visible = true;

                txtEmail.Text = fetchScaler("SELECT StudentEmail FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtFName.Text = fetchScaler("SELECT StudentFirstname FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtPassword.Text = fetchScaler("SELECT StudentPassword FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtProjectName.Text = fetchScaler("SELECT StudentProjectname FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtLName.Text = fetchScaler("SELECT StudentLastname FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtGroup.Text = fetchScaler("SELECT StudentGroup FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtBatch.Text = Convert.ToString(fetchScalerInt("SELECT StudentBatch FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text));
                txtTech.Text = fetchScaler("SELECT StudentTechnology FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
            }
            catch
            {
                //string msg = "Couldn't find enrollment number " + txtEnrowllment.Text + " !";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Enrollment number not found!')", true);

                lblEmail.Visible = false;
                lblFName.Visible = false;
                lblLName.Visible = false;
                lblPassword.Visible = false;
                lblProjectName.Visible = false;
                lblTechnology.Visible = false;
                lblGroup.Visible = false;
                lblBatch.Visible = false;
                txtEmail.Visible = false;
                txtFName.Visible = false;
                txtLName.Visible = false;
                txtPassword.Visible = false;
                txtProjectName.Visible = false;
                txtGroup.Visible = false;
                txtBatch.Visible = false;
                txtTech.Visible = false;
                txtEmail.Enabled = false;
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                txtPassword.Enabled = false;
                txtProjectName.Enabled = false;
                txtGroup.Enabled = false;
                txtBatch.Enabled = false;
                txtTech.Enabled = false;
                btnStudentDelete.Visible = false;

                Page.Form.DefaultButton = btnContinue.UniqueID;
            }
        }

        protected void btnClearAll_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                string deleteAllStudent = "DELETE FROM Student";
                string deleteAllData = "DELETE FROM DataUpdate";
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(deleteAllStudent, conn);
                conn.Open();
                C.ExecuteNonQuery();
                C.CommandText = deleteAllData;
                C.ExecuteNonQuery();
                conn.Close();

                Response.Write("<script>alert('All data related to every student was deleted permanently!')</script>");
            }
            catch
            {
                Response.Write("<script>An error occured while deleting the records. Please try again later!</script>");
            }
        }

        protected void btnStudentDelete_Click(object sender, EventArgs e)
        {
            try
            {
                //string msg = "All records associated with '" + txtEnrollment.Text + "' were deleted successfully!";
                string deleteSelectedStudent = "DELETE FROM Student WHERE StudentEnrollment='" + txtEnrollment.Text + "'";
                string deleteSelectedData = "DELETE FROM DataUpdate WHERE StudentEnrollmentNo='" + txtEnrollment.Text + "'";
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(deleteSelectedStudent, conn);
                conn.Open();
                C.ExecuteNonQuery();
                C.CommandText = deleteSelectedData;
                C.ExecuteNonQuery();
                conn.Close();

                lblEmail.Visible = false;
                lblFName.Visible = false;
                lblLName.Visible = false;
                lblPassword.Visible = false;
                lblProjectName.Visible = false;
                lblTechnology.Visible = false;
                lblGroup.Visible = false;
                lblBatch.Visible = false;
                txtEmail.Visible = false;
                txtFName.Visible = false;
                txtLName.Visible = false;
                txtPassword.Visible = false;
                txtProjectName.Visible = false;
                txtGroup.Visible = false;
                txtBatch.Visible = false;
                txtTech.Visible = false;
                txtEmail.Enabled = false;
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                txtPassword.Enabled = false;
                txtProjectName.Enabled = false;
                txtGroup.Enabled = false;
                txtBatch.Enabled = false;
                txtTech.Enabled = false;
                btnStudentDelete.Visible = false;
                txtEnrollment.Text = "";

                Page.Form.DefaultButton = btnContinue.UniqueID;

                Response.Write("<script>alert('Student record successfully deleted!')</script>");
            }
            catch
            {
                Response.Write("<script>alert('An unexpected error occured during the operation. Please try in a while!')</script>");
            }
        }
    }
}