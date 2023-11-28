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
using System.IO;

namespace Communique
{
    public partial class Login : System.Web.UI.Page
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

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }

        //private void ExportGridToPDF()
        //{

        //    Response.ContentType = "application/pdf";
        //    Response.AddHeader("content-disposition", "attachment;filename=Vithal_Wadje.pdf");
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    StringWriter sw = new StringWriter();
        //    HtmlTextWriter hw = new HtmlTextWriter(sw);
        //    gvHistory.RenderControl(hw);
        //    StringReader sr = new StringReader(sw.ToString());
        //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        //    pdfDoc.Open();
        //    htmlparser.Parse(sr);
        //    pdfDoc.Close();
        //    Response.Write(pdfDoc);
        //    Response.End();
        //    gvHistory.AllowPaging = true;
        //    gvHistory.DataBind();
        //}

        public void createPDF(string pdf_For)
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
                    text = grdCell.Text.Replace("&#39;","'");
                    if(text== "&nbsp;")
                    {
                        text = "";
                    }
                    if(text == "True")
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
            Response.AddHeader("content-disposition", "attachment;filename=" + pdf_For + ".pdf");
            Response.Write(newPDF);
            Response.Flush();
            Response.End();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Enr"] != null)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('New student inserted to the database.')", true);
                Response.Redirect("Student_Panel_Home.aspx");
            }
            else
            {
                Page.Form.DefaultButton = btnLogin.UniqueID;
                txtEnrollment.Focus();
            }
            //Response.Cookies["enrollment"].Expires = DateTime.Now.AddDays(-1);
        }

        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Signup.aspx");
        //}

        //protected void btnLogin_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Student_Panel_Home.aspx");
        //}

        //protected void btnFacultyLogin_Click(object sender, EventArgs e)
        //{
        //}

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Server.Transfer("Admin_Login.aspx");
        }

        protected void btnFacultyLogin_Click1(object sender, EventArgs e)
        {
            Server.Transfer("Faculty_Login.aspx");
        }

        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            /*string match*/
            //;
            //string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
            string en = "Select StudentPassword from Student where StudentEnrollment='" + txtEnrollment.Text + "';";

            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand(en);
            //C.Connection = conn;
            //conn.Open();
            //string enroll = (string)C.ExecuteScalar();
            //conn.Close();

            C.Connection = conn;
            conn.Open();
            string pass = (string)C.ExecuteScalar();
            conn.Close();

            if (txtPassword.Text == pass)
            {
                //if (Request.Cookies["enrollment"] != null)
                //{
                //    Response.Cookies["enrollment"].Expires = DateTime.Now.AddDays(-1);
                //}
                HttpCookie cookieEnrollment = new HttpCookie("enrollment");
                cookieEnrollment.Value = txtEnrollment.Text;
                cookieEnrollment.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(cookieEnrollment);
                Session["Enr"] = txtEnrollment.Text;
                Server.Transfer("Student_Panel_Home.aspx");
            }
            else
            {
                //Response.Write("<script language=C#>alert('Incorrect username or password. ')</script>");
                //lblError.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect username or password.')", true);
            }
        }

        protected void liSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void download_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void liBoth_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand("Select StudentPassword from Student where StudentEnrollment='" + txtE.Text + "'", conn);
                conn.Open();
                string pas = (string)C.ExecuteScalar();
                conn.Close();
                if (pas == txtP.Text)
                {
                    try { 
                    bindGrd("SELECT Agree, DU, Reason FROM DataUpdate WHERE StudentEnrollmentNo='" + txtE.Text + "'");
                    createPDF("Full record chart");
                    }
                    catch
                    {
                        Response.Write("<script>alert('You haven't uploaded any updates yet!')</script>");
                    }
                    //ExportGridToPDF();
                }
                else if (txtE.Text == null)
                {
                    Response.Write("<script>alert('Please enter the Enrollment number.')</script>");
                }
                else if (txtP.Text == null)
                {
                    Response.Write("<script>alert('Please enter the password.')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Incorrect username or password!')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Something went wrong. Try checking the connection!')</script>");
            }
        }

        protected void liClose_Click(object sender, EventArgs e)
        {
            txtE.Text = null;
            txtP.Text = null;
        }

        protected void liAccepted_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand("Select StudentPassword from Student where StudentEnrollment='" + txtE.Text + "'", conn);
                conn.Open();
                string pas = (string)C.ExecuteScalar();
                conn.Close();
                
                if (pas == txtP.Text)
                {
                    try
                    {
                        bindGrd("SELECT Agree, DU, Reason FROM DataUpdate WHERE Agree='True' AND StudentEnrollmentNo='" + txtE.Text + "'");
                        createPDF("All accepted updates");
                    }
                    catch
                    {
                        Response.Write("<script>alert('Sorry, you dont have any accepted updates.😓')</script>"); // 😓 
                    }
                    //ExportGridToPDF();
                }
                else if (txtE.Text == null)
                {
                    Response.Write("<script>alert('Please enter the Enrollment number.')</script>");
                }
                else if (txtP.Text == null)
                {
                    Response.Write("<script>alert('Please enter the password.')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Incorrect username or password!')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Something went wrong. Try checking the connection!')</script>");
            }
        }

        protected void liDeclined_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand("Select StudentPassword from Student where StudentEnrollment='" + txtE.Text + "'", conn);
                conn.Open();
                string pas = (string)C.ExecuteScalar();
                conn.Close();

                if (pas == txtP.Text)
                {
                    try
                    {
                        bindGrd("SELECT Agree, DU, Reason FROM DataUpdate WHERE Agree='False' AND StudentEnrollmentNo='" + txtE.Text + "'");
                        createPDF("All declined updates");
                    }
                    catch
                    {
                        Response.Write("<script>alert('Great, You dont have any accepted updates.🤩')</script>"); // 😓 
                    }
                    //ExportGridToPDF();
                }
                else if (txtE.Text == null)
                {
                    Response.Write("<script>alert('Please enter the Enrollment number.')</script>");
                }
                else if (txtP.Text == null)
                {
                    Response.Write("<script>alert('Please enter the password.')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Incorrect username or password!')</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('Something went wrong. Try checking the connection!')</script>");
            }
        }
    }
}