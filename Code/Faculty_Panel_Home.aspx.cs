using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Communique
{
    public partial class Faculty_Panel : System.Web.UI.Page
    {
        string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
        public string QuickExacScaler(string query)
        {
            string feed;
            SqlConnection conn = new SqlConnection(cs);
            SqlCommand C = new SqlCommand(query, conn);
            conn.Open();
            feed = (string)C.ExecuteScalar();
            C.Dispose();
            conn.Close();
            return feed;
        }
        public void GMail(string e)
        {
            string to = e; //To address    
            string from = "10communique@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = hndPromptForReason.Value;
            message.Subject = "Project update was declined!";
            message.Body = mailbody; //.Replace("'", "''"); //update = update.Replace("'", "''");
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("10communique@gmail.com", "-Admin0n!");
            client.EnableSsl = true;
            client.UseDefaultCredentials = true;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Email sent to your guide.')", true);
            }

            catch (Exception ex)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('System experienced difficulties composing an email! [Note: Try checking for proper internet the connection.]')", true);
                throw ex;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Em"] == null)
            {
                Response.Redirect("Faculty_Login.aspx");
            }
            else
            {
                string facEmail = Request.Cookies["email"].Value.ToString();
                string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
                string getName = "SELECT FacultyFirstname FROM Faculty WHERE FacultyEmail='" + facEmail + "'";
                SqlConnection conn = new SqlConnection(cs);
                SqlCommand C = new SqlCommand(getName, conn);
                conn.Open();
                string name = (string)C.ExecuteScalar();
                conn.Close();
                lblUser.Text = name.ToUpper();
                string getTech = "SELECT FacultyTechleader FROM Faculty WHERE FacultyEmail='" + facEmail + "'";
                SqlCommand t = new SqlCommand(getTech, conn);
                conn.Open();
                string tech = (string)t.ExecuteScalar();
                conn.Close();
                string getUpdates = "Select StudentFirstname, StudentLastname, StudentProjectname, DUID, Agree from studentExtend where Technology='" + tech + "'";
                conn.Open();
                //SqlCommand addUpdates = new SqlCommand(getUpdates, conn);
                //lbsNoteBox.DataSource = addUpdates.ExecuteReader();
                //lbsNoteBox.DataTextField = "StudentFirstname" + " " + "StudentLastname" + " (" + "StudentProjectname" + ") ";
                //lbsNoteBox.DataBind();
                SqlDataAdapter adpt = new SqlDataAdapter(getUpdates, conn);
                DataSet DS = new DataSet();
                adpt.Fill(DS, "studentExtend");
                //lbsNoteBox.DataSource = DS;
                //lbsNoteBox.DataBind();
                DataTable tbl = DS.Tables[0];
                DataRow tempRow = null;
                foreach (DataRow tempRowVar in tbl.Rows)
                {
                    tempRow = tempRowVar;
                    if (Convert.ToInt32(tempRow["Agree"]) != 0)
                    {
                        lbsNoteBox.Items.Insert(0, new ListItem ((tempRow["StudentFirstname"] + " " + tempRow["StudentLastname"] + " ( " + tempRow["StudentProjectname"] + " ) " + "   [ACCEPTED]"), Convert.ToString(tempRow["DUID"])));
                    }
                    else
                    {
                        lbsNoteBox.Items.Insert(0, new ListItem((tempRow["StudentFirstname"] + " " + tempRow["StudentLastname"] + " ( " + tempRow["StudentProjectname"] + " ) "), Convert.ToString(tempRow["DUID"])));
                    }
                    //lbsNoteBox.DataValueField = Convert.ToString(Convert.ToString(tempRow["DUID"]));
                }
                //lbsNoteBox.DataTextField = "StudentFirstname";
                //lbsNoteBox.DataValueField = Convert.ToString("DUID");
                conn.Close();

            }
            
            //TextBox txtX = new TextBox();
            //frmFacultyPanel.Controls.Add(txtX);
            //txtX.
            //lbsNoteBox.Items.Insert(0, "Helo");
        }

        protected void btnProjects_Click(object sender, EventArgs e)
        {
            Server.Transfer("Faculty_Panel_ProjectBrowse.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("Em");
            Response.Redirect("~/Faculty_Login.aspx");
            Response.Cookies["email"].Expires = DateTime.Now.AddDays(-1);
        }

        protected void btnAcceptUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (lbsNoteBox.SelectedItem == null)
                {
                    Response.Write("<script>alert('Please select an update entry to confirm!')</script>");
                }
                else
                {
                    string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
                    string setResult = "UPDATE DataUpdate SET Agree=1 where DUID=" + lbsNoteBox.SelectedItem.Value;
                    SqlConnection conn = new SqlConnection(cs);
                    SqlCommand C = new SqlCommand(setResult, conn);
                    conn.Open();
                    C.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Faculty_Panel_Home.aspx");
                }
            }
            catch
            {
                Response.Write("<script>alert('Something went wrong! Please try checking the connection.')</script>");
            }
        }

        protected void btnDecline_Click(object sender, EventArgs e)
        {
            try
            {
                if (lbsNoteBox.SelectedItem == null)
                {
                    Response.Write("<script>alert('Please select a project update to reject!')</script>");
                }
                else if (hndPromptForReason.Value == "" || hndPromptForReason.Value == null)
                {
                    hndPromptForReason.Value = "[No reason was provided for this entry.]";
                }
                else
                {
                    string R = hndPromptForReason.Value;
                    string cs = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
                    string update = hndPromptForReason.Value;
                    update = update.Replace("'", "''");
                    string setResult = "UPDATE DataUpdate SET Agree=0, Reason='" + update + "' where DUID=" + lbsNoteBox.SelectedItem.Value;
                    SqlConnection conn = new SqlConnection(cs);
                    SqlCommand C = new SqlCommand(setResult, conn);
                    conn.Open();
                    C.ExecuteNonQuery();
                    conn.Close();
                    //Send mail
                    string enroll = QuickExacScaler("SELECT StudentEnrollmentNo FROM DataUpdate WHERE DUID='" + lbsNoteBox.SelectedItem.Value + "'");
                    string eID = QuickExacScaler("SELECT StudentEmail FROM Student WHERE StudentEnrollment='" + enroll + "'");
                    GMail(eID);
                    Response.Redirect("Faculty_Panel_Home.aspx");
                }
            }
            catch
            {
                Response.Write("<script>alert('Something went wrong! Please try checking the connection.')</script>");
            }
        }
    }
}