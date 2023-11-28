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
    public partial class Admin : System.Web.UI.Page
    {
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
        public void fillDropDown(string query, string itemColumn1, string itemColumn2, string valueColumn, DropDownList ddl)
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
                    ddl.DataTextField = ds.Tables[0].Columns[itemColumn1].ToString();
                    ddl.DataValueField = ds.Tables[0].Columns[valueColumn].ToString();
                    ddl.DataSource = ds.Tables[0];
                    ddl.DataBind();
                    ddl.Items.Insert(0, new ListItem("---- Select Faculty ----", "0"));
                    conn.Close();
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Error connecting to server');", true);
                }
            }
        }

        public string fetchScale(string query)
        {
            string ret = null;
            try
            {
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(query, conn);
                conn.Open();
                ret = (string)C.ExecuteScalar();
                conn.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ret;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adm"] == null)
            {
                Response.Redirect("Admin_Login.aspx");
            }
            else
            {
                fillDropDown("SELECT TechnologyName FROM Technology", "TechnologyName", ddlTechLeader);
                for (int i = 0; i < ddlTechLeader.Items.Count; i++)
                    ddlTechLeader.Items[i].Attributes.Add("style", "background-color:#746e02");
                fillDropDown("SELECT FacultyFirstname, FacultyLastname, FacultyEmail FROM Faculty", "FacultyFirstname", "FacultyLastname", "FacultyEmail", ddlFac);
                for (int i = 0; i < ddlFac.Items.Count; i++)
                    ddlFac.Items[i].Attributes.Add("style", "background-color:#746e02");
                ddlFac.Focus();
            }
        }

        protected void chkEditMode_CheckedChanged(object sender, EventArgs e)
        {
            if (chkEditMode.Checked == true)
            {
                txtFName.Enabled = true;
                txtLName.Enabled = true;
                ddlTechLeader.Enabled = true;
                txtFacPassword.Enabled = true;
                btnFacultyUpdate.Visible = true;
                Page.Form.DefaultButton = btnFacultyUpdate.UniqueID;
            }
            else
            {
                txtFName.Enabled = false;
                txtLName.Enabled = false;
                ddlTechLeader.Enabled = false;
                txtFacPassword.Enabled = false;
                btnFacultyUpdate.Visible = false;
                Page.Form.DefaultButton = btnContinue.UniqueID;
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            lblFName.Visible = true;
            lblLName.Visible = true;
            lblTechLeader.Visible = true;
            lblFacPassword.Visible = true;
            txtFName.Visible = true;
            txtLName.Visible = true;
            ddlTechLeader.Visible = true;
            txtFacPassword.Visible = true;
            chkEditMode.Visible = true;

            try
            {
                txtFacPassword.Text = fetchScale("SELECT FacultyPassword FROM Faculty WHERE FacultyEmail='" + ddlFac.SelectedValue + "'");
                txtFName.Text = fetchScale("SELECT FacultyFirstname FROM Faculty WHERE FacultyEmail='" + ddlFac.SelectedValue + "'");
                txtLName.Text = fetchScale("SELECT FacultyLastname FROM Faculty WHERE FacultyEmail='" + ddlFac.SelectedValue + "'");
                ddlTechLeader.SelectedIndex = ddlTechLeader.Items.IndexOf(ddlTechLeader.Items.FindByText(fetchScale("SELECT FacultyTechleader FROM Faculty WHERE FacultyEmail='" + ddlFac.SelectedValue + "'")));
                
                if(txtFacPassword.Text=="" || txtFacPassword.Text==null || txtFName.Text=="" || txtFName.Text==null || txtLName.Text=="" || txtLName.Text == null)
                {
                    lblFName.Visible = false;
                    lblLName.Visible = false;
                    lblTechLeader.Visible = false;
                    lblFacPassword.Visible = false;
                    txtFName.Visible = false;
                    txtLName.Visible = false;
                    ddlTechLeader.Visible = false;
                    txtFacPassword.Visible = false;
                    chkEditMode.Visible = false;

                    Response.Write("<script>alert('Email address not found!')</script>");
                }
            }
            catch
            {
                lblFName.Visible = false;
                lblLName.Visible = false;
                lblTechLeader.Visible = false;
                lblFacPassword.Visible = false;
                txtFName.Visible = false;
                txtLName.Visible = false;
                ddlTechLeader.Visible = false;
                txtFacPassword.Visible = false;
                chkEditMode.Visible = false;
                btnFacultyUpdate.Visible = false;

                Response.Write("<script>alert('Trouble connecting to the server! Please check the connection.')</script>");
            }
        }

        protected void btnFacultyUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string dataUpdate = "UPDATE Faculty SET FacultyFirstname='" + txtFName.Text.ToLower() + "', FacultyLastname='" + txtLName.Text.ToLower() + "', FacultyTechleader='" + ddlTechLeader.Text + "', FacultyPassword='" + txtFacPassword.Text + "', FacultyEmail='" + ddlFac.SelectedValue + "' WHERE FacultyEmail='" + ddlFac.SelectedValue + "'";
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(dataUpdate, conn);
                conn.Open();
                C.ExecuteNonQuery();
                conn.Close();

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Faculty information updated successfully!')", true);
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Connection or server error! Please check the data and try again.')", true);
            }
        }
    }
}