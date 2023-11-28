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
    public partial class Student_Select : System.Web.UI.Page
    {
        static string fix;
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
                fillDropDown("SELECT BatchYear FROM Batch", "BatchYear", ddlBatch);
                fillDropDown("SELECT TechnologyName FROM Technology", "TechnologyName", ddlTech);

                for (int i = 0; i < ddlTech.Items.Count; i++)
                {
                    ddlTech.Items[i].Attributes.Add("style", "background-color:#746e02");
                }
                for (int i = 0; i < ddlBatch.Items.Count; i++)
                {
                    ddlBatch.Items[i].Attributes.Add("style", "background-color:#746e02");
                }

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
                ddlBatch.Visible = true;
                ddlTech.Visible = true;
                chkEditMode.Visible = true;

                txtEmail.Text = fetchScaler("SELECT StudentEmail FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtFName.Text = fetchScaler("SELECT StudentFirstname FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtPassword.Text = fetchScaler("SELECT StudentPassword FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtProjectName.Text = fetchScaler("SELECT StudentProjectname FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtLName.Text = fetchScaler("SELECT StudentLastname FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                txtGroup.Text = fetchScaler("SELECT StudentGroup FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text);
                ddlBatch.SelectedIndex = ddlBatch.Items.IndexOf(ddlBatch.Items.FindByText(Convert.ToString(fetchScalerInt("SELECT StudentBatch FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text))));
                ddlTech.SelectedIndex = ddlTech.Items.IndexOf(ddlTech.Items.FindByText(fetchScaler("SELECT StudentTechnology FROM Student WHERE StudentEnrollment=" + txtEnrollment.Text)));

                fix = txtEnrollment.Text;
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
                ddlBatch.Visible = false;
                ddlTech.Visible = false;
                chkEditMode.Visible = false;
                chkEditMode.Checked = false;
                txtEmail.Enabled = false;
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                txtPassword.Enabled = false;
                txtProjectName.Enabled = false;
                txtGroup.Enabled = false;
                ddlBatch.Enabled = false;
                ddlTech.Enabled = false;
                btnStudentUpdate.Visible = false;
            }
        }

        protected void chkEditMode_CheckedChanged(object sender, EventArgs e)
        {
            if (chkEditMode.Checked == true)
            {
                txtEmail.Enabled = true;
                txtFName.Enabled = true;
                txtLName.Enabled = true;
                txtPassword.Enabled = true;
                txtProjectName.Enabled = true;
                txtGroup.Enabled = true;
                ddlBatch.Enabled = true;
                ddlTech.Enabled = true;
                btnStudentUpdate.Visible = true;
                Page.Form.DefaultButton = btnStudentUpdate.UniqueID;
            }
            else
            {
                txtEmail.Enabled = false;
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                txtPassword.Enabled = false;
                txtProjectName.Enabled = false;
                txtGroup.Enabled = false;
                ddlBatch.Enabled = false;
                ddlTech.Enabled = false;
                btnStudentUpdate.Visible = false;
                Page.Form.DefaultButton = btnContinue.UniqueID;
            }
        }

        protected void btnStudentUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string updateData = "UPDATE Student SET StudentFirstname='" + txtFName.Text.ToLower() + "'" +
                    ",StudentLastname='" + txtLName.Text.ToLower() + "'" +
                    ",StudentTechnology='" + ddlTech.Text + "'" +
                    ",StudentBatch='" + Convert.ToInt32(ddlBatch.Text) + "'" +
                    ",StudentGroup='" + txtGroup.Text + "'" +
                    ",StudentProjectname='" + txtProjectName.Text.ToLower() + "'" +
                    ",StudentPassword='" + txtPassword.Text + "'" +
                    ",StudentEmail='" + txtEmail.Text.ToLower() + "'" +
                    ",StudentEnrollment='" + txtEnrollment.Text + "'" +
                    " WHERE StudentEnrollment='" + fix + "'";
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(updateData, conn);
                conn.Open();
                C.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Update successful!')", true);
                fix = txtEnrollment.Text;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed to update data! Try checking the connection!')", true);
            }
        }
    }
}