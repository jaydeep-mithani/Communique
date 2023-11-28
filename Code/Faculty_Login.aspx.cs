using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace Communique
{
    public partial class Faculty_Login : System.Web.UI.Page
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

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = btnFLogin.UniqueID;
            txtFEmail.Focus();
        }

        protected void btnFStudentLogin_Click(object sender, EventArgs e)
        {
            Server.Transfer("Student_Login.aspx");
        }

        protected void btnFAdminLogin_Click(object sender, EventArgs e)
        {
            Server.Transfer("Admin_Login.aspx");
        }

        protected void btnFLogin_Click(object sender, EventArgs e)
        {
            string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
            string en = "Select FacultyPassword from Faculty where FacultyEmail='" + txtFEmail.Text + "'";

            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand(en, conn);

            //C.Connection = conn;
            conn.Open();
            string pass = (string)C.ExecuteScalar();
            conn.Close();
            //if()
            if (txtFPassword.Text == pass)
            {
                HttpCookie emailCookie = new HttpCookie("email");
                emailCookie.Value = txtFEmail.Text;
                emailCookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(emailCookie);
                Session["Em"] = txtFEmail.Text;
                Server.Transfer("Faculty_Panel_Home.aspx");
                //Session.RemoveAll();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect username or password.')", true);
                Session.RemoveAll();
            }
        }

        protected void liClose_Click(object sender, EventArgs e)
        {
            txtE.Text = null;
            txtP.Text = null;
        }

        protected void btnGetProjects_Click(object sender, EventArgs e)
        {
            string un = txtE.Text;
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand("SELECT FacultyPassword FROM Faculty WHERE FacultyEmail='" + un + "'", conn);
            conn.Open();
            string pas = (string)C.ExecuteScalar();
            conn.Close();

            if (pas == txtP.Text)
            {
                C.CommandText = "SELECT FacultyTechleader FROM Faculty WHERE FacultyEmail='" + un + "'";
                conn.Open();
                string t = (string)C.ExecuteScalar();
                conn.Close();
                try
                {
                    SqlCommand com = new SqlCommand("SELECT StudentProjectname FROM pdfFaculty WHERE StudentTechnology='" + t + "'", conn);
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

                    for (int i = 0; i < ddlP.Items.Count; i++)
                    {
                        ddlP.Items[i].Attributes.Add("style", "background-color: #003b33");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('No projects found!')</script>");
                }
            }
            else if (txtE.Text == "" || txtE.Text == null)
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

        protected void liAccepted_Click(object sender, EventArgs e)
        {
            string em = txtE.Text;
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand("SELECT FacultyPassword FROM Faculty WHERE FacultyEmail='" + em + "'", conn);
            conn.Open();
            string pas = (string)C.ExecuteScalar();
            conn.Close();

            if (pas == txtP.Text)
            {
                C.CommandText = "SELECT FacultyTechleader FROM Faculty WHERE FacultyEmail='" + em + "'";
                conn.Open();
                string t = (string)C.ExecuteScalar();
                conn.Close();
                try
                {
                    if (ddlP.SelectedItem == null || ddlP.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, DU, Reason, Agree FROM pdfFaculty WHERE Agree='True' AND StudentTechnology='" + t + "'");
                        createPDF("All accepted updates of " + t);
                    }
                    else
                    {
                        bindGrd("SELECT StudentProjectname, DU, Reason, Agree FROM pdfFaculty WHERE Agree='True' AND StudentTechnology='" + t + "' AND  StudentProjectname='" + ddlP.SelectedItem + "'");
                        createPDF("All accepted updates of " + ddlP.SelectedItem.Text);
                    }
                }
                catch
                {
                    Response.Write("<script>alert('No such record was found.')</script>");
                }
            }
            else if (txtE.Text == "" || txtE.Text == null)
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
            string em = txtE.Text;
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand("SELECT FacultyPassword FROM Faculty WHERE FacultyEmail='" + em + "'", conn);
            conn.Open();
            string pas = (string)C.ExecuteScalar();
            conn.Close();

            if (pas == txtP.Text)
            {
                C.CommandText = "SELECT FacultyTechleader FROM Faculty WHERE FacultyEmail='" + em + "'";
                conn.Open();
                string t = (string)C.ExecuteScalar();
                conn.Close();
                try
                {
                    if (ddlP.SelectedItem == null || ddlP.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, DU, Reason, Agree FROM pdfFaculty WHERE Agree='False' AND StudentTechnology='" + t + "'");
                        createPDF("All declined updates of " + t);
                    }
                    else
                    {
                        bindGrd("SELECT StudentProjectname, DU, Reason, Agree FROM pdfFaculty WHERE Agree='False' AND StudentTechnology='" + t + "' AND  StudentProjectname='" + ddlP.SelectedItem + "'");
                        createPDF("All declined updates of " + ddlP.SelectedItem.Text);
                    }
                }
                catch
                {
                    Response.Write("<script>alert('No such record was found.')</script>");
                }
            }
            else if (txtE.Text == "" || txtE.Text == null)
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
            string em = txtE.Text;
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand("SELECT FacultyPassword FROM Faculty WHERE FacultyEmail='" + em + "'", conn);
            conn.Open();
            string pas = (string)C.ExecuteScalar();
            conn.Close();

            if (pas == txtP.Text)
            {
                C.CommandText = "SELECT FacultyTechleader FROM Faculty WHERE FacultyEmail='" + em + "'";
                conn.Open();
                string t = (string)C.ExecuteScalar();
                conn.Close();
                try
                {
                    if (ddlP.SelectedItem == null || ddlP.SelectedItem.Text == "----Select----")
                    {
                        bindGrd("SELECT StudentProjectname, DU, Reason, Agree FROM pdfFaculty WHERE StudentTechnology='" + t + "'");
                        createPDF("All updates of " + t);
                    }
                    else
                    {
                        bindGrd("SELECT StudentProjectname, DU, Reason, Agree FROM pdfFaculty WHERE StudentTechnology='" + t + "' AND  StudentProjectname='" + ddlP.SelectedItem + "'");
                        createPDF("All updates of " + ddlP.SelectedItem.Text);
                    }
                }
                catch
                {
                    Response.Write("<script>alert('No such record was found.')</script>");
                }
            }
            else if (txtE.Text == "" || txtE.Text == null)
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