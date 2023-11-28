using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Data;

namespace Communique
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";

        public void bindGrd(string query)
        {
            try
            {
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader dr = C.ExecuteReader();
                gvHistory.DataSource = dr;
                gvHistory.DataBind();
                conn.Close();
            }
            catch (Exception x)
            {
                throw x;
            }
        }

        //public override void VerifyRenderingInServerForm(Control control)
        //{
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        //}

        public void createPDF(string FileName)
        {
            string text;
            PdfPTable tbl = new PdfPTable(gvHistory.Columns.Count);

            foreach (TableCell grdHeadCell in gvHistory.HeaderRow.Cells)
            {
                Font fnt = new Font();
                fnt.Color = new BaseColor(gvHistory.HeaderStyle.ForeColor);

                PdfPCell cell = new PdfPCell(new Phrase(grdHeadCell.Text, fnt));
                cell.BackgroundColor = new BaseColor(gvHistory.HeaderStyle.BackColor);
                tbl.AddCell(cell);
            }

            foreach (GridViewRow grdRow in gvHistory.Rows)
            {
                foreach (TableCell grdCell in grdRow.Cells)
                {
                    text = grdCell.Text.Replace("&#39;", "'");
                    if (text == "&nbsp;")
                    {
                        text = "";
                    }
                    if (text == "True")
                    {
                        text = "Accepted";
                    }
                    if (text == "False")
                    {
                        text = "Declined";
                    }
                    //if (text = "https://mail.google.com/mail/u/0/#inbox")
                    //{
                    //    text = "";
                    //}
                    Font fnt = new Font();
                    fnt.Color = new BaseColor(gvHistory.RowStyle.ForeColor);

                    PdfPCell cell = new PdfPCell(new Phrase(text, fnt));
                    cell.BackgroundColor = new BaseColor(gvHistory.RowStyle.BackColor);
                    tbl.AddCell(cell);
                }
            }

            Document newPDF = new Document(PageSize.A4, 25f, 25f, 25f, 25f);
            PdfWriter.GetInstance(newPDF, Response.OutputStream);

            newPDF.Open();
            newPDF.Add(tbl);
            newPDF.Close();

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + FileName + ".pdf");
            Response.Write(newPDF);
            Response.Flush();
            Response.End();
        }

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
                    ddl.Items.Insert(0, "----Select----");
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Error connecting to server');", true);
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adm"] != null)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('New student inserted to the database.')", true);
                Response.Redirect("Admin_Startup.aspx");
            }
            else
            {
                string getTech = "SELECT TechnologyName FROM Technology";
                fillDropDown(getTech, "TechnologyName", ddlT);
                for (int i = 0; i < ddlT.Items.Count; i++)
                {
                    ddlT.Items[i].Attributes.Add("style", "background-color:#746e02");
                }
                Page.Form.DefaultButton = btnALogin.UniqueID;
                txtAUsername.Focus();
            }
        }

        protected void btnAFacultyLogin_Click(object sender, EventArgs e)
        {
            Server.Transfer("Faculty_Login.aspx");
        }

        protected void btnAStudentLogin_Click(object sender, EventArgs e)
        {
            Server.Transfer("Student_Login.aspx");
        }

        public string fetchLogin(string query)
        {
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand(query, conn);
            conn.Open();
            string ret = (string)C.ExecuteScalar();
            conn.Close();
            return ret;
        }

        protected void btnALogin_Click(object sender, EventArgs e)
        {
            if (txtAPassword.Text == fetchLogin("SELECT AdminPassword FROM Admin WHERE AdminUsername='" + txtAUsername.Text + "'"))
            {
                //HttpCookie cookieAdmin = new HttpCookie("admin");
                //cookieAdmin.Value = "Admin";
                //cookieAdmin.Expires = DateTime.Now.AddDays(1);
                //Response.Cookies.Add(cookieAdmin);
                Session["Adm"] = "AdminOnLine";
                Server.Transfer("Admin_Startup.aspx");
            }
            else
            {
                //Label lblInvalid = new Label();
                //frmAdminLogin.Controls.Add(lblInvalid);
                //lblInvalid.Text = "Invalid username";
                //lblInvalid.ForeColor = System.Drawing.Color.LightPink;
                //lblInvalid.CssClass = "loginerr";
                Response.Write("<script>alert('Incorrect username or password.')</script>");
            }
        }

        protected void liClose_Click(object sender, EventArgs e)
        {
            txtU.Text = null;
            txtP.Text = null;
        }

        protected void ddlT_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlF.Items.Clear();
            ddlP.Items.Clear();
            //Response.Write("<script>alert('Code behind reached!')</script>");
            if (ddlT.SelectedItem.Text != "----Select----")
            {
                string getFaculty = "SELECT FacultyFirstname FROM Faculty WHERE FacultyTechleader='" + ddlT.SelectedItem + "'";
                string getProjects = "SELECT StudentProjectname FROM Student WHERE StudentTechnology='" + ddlT.SelectedItem + "'";
                try
                {
                    SqlConnection conn = new SqlConnection(cs);
                    SqlCommand com = new SqlCommand(getFaculty, conn);
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(com);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    ddlF.DataTextField = ds.Tables[0].Columns["FacultyFirstname"].ToString();
                    ddlF.DataValueField = ds.Tables[0].Columns["FacultyFirstname"].ToString();
                    ddlF.DataSource = ds.Tables[0];
                    ddlF.DataBind();
                    conn.Close();
                    ddlF.Items.Insert(0, "----Select----");

                    com.CommandText = getProjects;
                    conn.Open();
                    SqlDataAdapter DA = new SqlDataAdapter(com);
                    DataSet DS = new DataSet();
                    DA.Fill(DS);
                    ddlP.DataTextField = DS.Tables[0].Columns["StudentProjectname"].ToString();
                    ddlP.DataValueField = DS.Tables[0].Columns["StudentProjectname"].ToString();
                    ddlP.DataSource = DS.Tables[0];
                    ddlP.DataBind();
                    conn.Close();
                    ddlP.Items.Insert(0, "----Select----"); 
                    
                    for (int i = 0; i < ddlF.Items.Count; i++)
                    {
                        ddlF.Items[i].Attributes.Add("style", "background-color:#746e02");
                    }
                    for (int i = 0; i < ddlP.Items.Count; i++)
                    {
                        ddlP.Items[i].Attributes.Add("style", "background-color:#746e02");
                    }
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Error connecting to server');", true);
                }
                //fillDropDown(getFaculty, "FacultyFirstname", ddlF);
                //fillDropDown(getProjects, "StudentProjectname", ddlP);
                //Response.Write("<script>popForDownload()</script>");
                string re = "popForDownload()";
                ScriptManager.RegisterClientScriptBlock(this, typeof(string), "uniqueKey", re, true);
            }
        }

        protected void liAccepted_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand("SELECT AdminPassword FROM Admin WHERE AdminUsername='" + txtU.Text + "'", conn);
            conn.Open();
            string pas = (string)C.ExecuteScalar();
            conn.Close();

            if(pas == txtP.Text)
            {
                try
                {
                    if (ddlT.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Agree='True'");
                        createPDF("All Accepted Updates");
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text == "----Select----" && ddlP.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Agree='True' AND Technology='" + ddlT.SelectedItem + "'");
                        createPDF("All accepted updated of " + ddlT.SelectedItem.Text);
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text != "----Select----" && ddlP.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Agree='True' AND Technology='" + ddlT.SelectedItem + "' AND FacultyFirstname='" + ddlF.SelectedItem + "'");
                        createPDF("Updates accepted by " + ddlF.SelectedItem.Text);
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text == "----Select----" && ddlP.SelectedItem.Text != "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Agree='True' AND Technology='" + ddlT.SelectedItem + "' AND StudentProjectname='" + ddlP.SelectedItem + "'");
                        createPDF("Accepted updates of " + ddlP.SelectedItem.Text);
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text != "----Select----" && ddlP.SelectedItem.Text != "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Agree='True' AND Technology='" + ddlT.SelectedItem + "' AND  FacultyFirstname='" + ddlF.SelectedItem + "' AND StudentProjectname='" + ddlP.SelectedItem + "'");
                        createPDF("Updates accepted by " + ddlF.SelectedItem.Text + " for " + ddlP.SelectedItem.Text);
                    }
                    else
                    {
                        Response.Write("<script>alert('Something went wrong! Please try again in a while.')</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('No such record was found.')</script>");
                }
            }
            else if(txtU.Text=="" || txtU.Text == null)
            {
                Response.Write("<script>alert('Please enter the username!')</script>");
            }
            else if (txtP.Text == "" || txtP.Text == null)
            {
                Response.Write("<script>alert('Please enter the Password!')</script>");
            }
            else
            {
                Response.Write("<script>alert('Incorrect username or password!')</script>");
            }
        }

        protected void liDeclined_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand("SELECT AdminPassword FROM Admin WHERE AdminUsername='" + txtU.Text + "'", conn);
            conn.Open();
            string pas = (string)C.ExecuteScalar();
            conn.Close();

            if (pas == txtP.Text)
            {
                try
                {
                    if (ddlT.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Agree='False'");
                        createPDF("All Declined Updates");
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text == "----Select----" && ddlP.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Agree='False' AND Technology='" + ddlT.SelectedItem + "'");
                        createPDF("All declined updated of " + ddlT.SelectedItem.Text);
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text != "----Select----" && ddlP.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Agree='False' AND Technology='" + ddlT.SelectedItem + "' AND FacultyFirstname='" + ddlF.SelectedItem + "'");
                        createPDF("Updates declined by " + ddlF.SelectedItem.Text);
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text == "----Select----" && ddlP.SelectedItem.Text != "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Agree='False' AND Technology='" + ddlT.SelectedItem + "' AND StudentProjectname='" + ddlP.SelectedItem + "'");
                        createPDF("Declined updates of " + ddlP.SelectedItem.Text);
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text != "----Select----" && ddlP.SelectedItem.Text != "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Agree='False' AND Technology='" + ddlT.SelectedItem + "' AND StudentProjectname='" + ddlP.SelectedItem + "' AND FacultyFirstname='" + ddlF.SelectedItem + "'");
                        createPDF("Updates declined by " + ddlF.SelectedItem.Text + " for " + ddlP.SelectedItem.Text);
                    }
                    else
                    {
                        Response.Write("<script>alert('Something went wrong! Please try again in a while.')</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('No such record was found.')</script>");
                }
            }
            else if (txtU.Text == "" || txtU.Text == null)
            {
                Response.Write("<script>alert('Please enter the username!')</script>");
            }
            else if (txtP.Text == "" || txtP.Text == null)
            {
                Response.Write("<script>alert('Please enter the Password!')</script>");
            }
            else
            {
                Response.Write("<script>alert('Incorrect username or password!')</script>");
            }
        }

        protected void liBoth_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand("SELECT AdminPassword FROM Admin WHERE AdminUsername='" + txtU.Text + "'", conn);
            conn.Open();
            string pas = (string)C.ExecuteScalar();
            conn.Close();

            if (pas == txtP.Text)
            {
                //try
                //{
                    if (ddlT.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData");
                        createPDF("All Project Updates");
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text == "----Select----" && ddlP.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Technology='" + ddlT.SelectedItem + "'");
                        createPDF("All updates of " + ddlT.SelectedItem.Text);
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text != "----Select----" && ddlP.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Technology='" + ddlT.SelectedItem + "' AND FacultyFirstname='" + ddlF.SelectedItem + "'");
                        createPDF("All updates under " + ddlF.SelectedItem.Text);
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text == "----Select----" && ddlP.SelectedItem.Text != "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Technology='" + ddlT.SelectedItem + "' AND StudentProjectname='" + ddlP.SelectedItem + "'");
                        createPDF("All updates of " + ddlP.SelectedItem.Text);
                    }
                    else if (ddlT.SelectedItem.Text != "----Select----" && ddlF.SelectedItem.Text != "----Select----" && ddlP.SelectedItem.Text != "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, Technology, DU, Reason, Agree, FacultyFirstname, FacultyLastname FROM pdfData WHERE Technology='" + ddlT.SelectedItem + "' AND StudentProjectname='" + ddlP.SelectedItem + "' AND FacultyFirstname='" + ddlF.SelectedItem + "'");
                        createPDF("All updates under " + ddlF.SelectedItem.Text + " for " + ddlP.SelectedItem.Text);
                    }
                    else
                    {
                        Response.Write("<script>alert('Something went wrong! Please try again in a while.')</script>");
                    }
                //}
                //catch
                //{
                //    Response.Write("<script>alert('No such record was found.')</script>");
                //}
            }
            else if (txtU.Text == "" || txtU.Text == null)
            {
                Response.Write("<script>alert('Please enter the username!')</script>");
            }
            else if (txtP.Text == "" || txtP.Text == null)
            {
                Response.Write("<script>alert('Please enter the Password!')</script>");
            }
            else
            {
                Response.Write("<script>alert('Incorrect username or password!')</script>");
            }
        }
    }
}