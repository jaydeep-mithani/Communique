using System;
using System.Collections.Generic;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace Communique
{
    public partial class Student_Panel : System.Web.UI.Page
    {
        string strCon = @"Data Source=DESKTOP-MS10Q25\JERRYSSERVER;Initial Catalog=Communique;Integrated Security=True";
        static string em;

        public string QuickExacScaler(string query) 
        {
            string feed;
            SqlConnection conn = new SqlConnection(strCon);
            SqlCommand C = new SqlCommand(query, conn);
            conn.Open();
            feed = (string)C.ExecuteScalar();
            C.Dispose();
            conn.Close();
            return feed;
        }
        public void SendMail(string e, string fName, string lName, string pName)
        {

            string to = e; //To address    
            string from = "10communique@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = txtProgressDicription.Text;
            message.Subject = fName + " " + lName + " (" + pName + ")";
            message.Body = "Kindely accept, " + pName + "<br /><br />" + mailbody; //.Replace("'", "''"); //update = update.Replace("'", "''");
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
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('System experienced difficulties composing an email! [Note: Try checking for proper internet the connection.]')", true);
                throw ex;
            }

            //MailMessage mail = new MailMessage();
            //mail.To.Add("madhudeepan9735@gmail.com");

            //mail.From = new MailAddress("asceticassassinmaroon5@gmail.com");
            //mail.Subject = "Test Email";
            //mail.Priority = MailPriority.High;
            //string Body = txtProgressDicription.Text;
            //mail.Body = Body;
            //SmtpClient smtp = new SmtpClient();
            //smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
            //smtp.Port = 587;
            //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            //smtp.UseDefaultCredentials = false;
            //smtp.Credentials = new System.Net.NetworkCredential("asceticassassinmaroon5@gmail.com", "nothingistrueeverythingispermitted");

            ////Or your Smtp Email ID and Password
            //smtp.EnableSsl = true;
            //smtp.Send(mail);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Enr"]==null)
            {
                Response.Redirect("Student_Login.aspx");
            }
            else
            {
                em = Request.Cookies["enrollment"].Value.ToString();
                SqlConnection conn = new SqlConnection(strCon);
                string getName = "SELECT StudentFirstname FROM Student WHERE StudentEnrollment='" + em + "'";
                SqlCommand C = new SqlCommand(getName, conn);
                conn.Open();
                string name = (string)C.ExecuteScalar();
                conn.Close();
                lblUser.Text = name.ToUpper();
            }
            //Page.Form.DefaultButton = btnConfirm.UniqueID; 
            //txtProgressDicription.Focus();
        }

        protected void txtProgressDicription_TextChanged(object sender, EventArgs e)
        {     
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                //Getting e-mailing info
                string guideTech = QuickExacScaler("SELECT StudentTechnology FROM Student WHERE StudentEnrollment='" + em + "'");
                string guideEmail = QuickExacScaler("SELECT FacultyEmail FROM Faculty WHERE FacultyTechleader='" + guideTech + "'");
                string nameF = QuickExacScaler("SELECT StudentFirstname FROM Student WHERE StudentEnrollment='" + em + "'");
                string nameL = QuickExacScaler("SELECT StudentLastname FROM Student WHERE StudentEnrollment='" + em + "'");
                string nameP = QuickExacScaler("SELECT StudentProjectname FROM Student WHERE StudentEnrollment='" + em + "'");

                //Senging mail
                SendMail(guideEmail, nameF, nameL, nameP);

                //Check update text
                if (txtProgressDicription.Text == "" || txtProgressDicription.Text == null)
                {
                    txtProgressDicription.Text = "[No project update discription was written by " + nameF + " " + nameL + ".(Blank data sent)]";
                }

                //Storing data to the database
                SqlConnection conn = new SqlConnection(strCon);
                string getTech = "SELECT StudentTechnology FROM Student WHERE StudentEnrollment='" + em + "'";
                SqlCommand t = new SqlCommand(getTech, conn);
                conn.Open();
                string tech = (string)t.ExecuteScalar();
                conn.Close();
                string update = txtProgressDicription.Text;
                update = update.Replace("'", "''");
                string insertData = "INSERT INTO DataUpdate (StudentEnrollmentNo, DU, Agree, Technology) VALUES ('" + em + "', '" + update + "', 'False', '" + tech + "')";
                SqlCommand storeUpdate = new SqlCommand(insertData, conn);

                conn.Open();
                storeUpdate.ExecuteNonQuery();
                conn.Close();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thank you! The updates were successfully registered. Please check the history panel later for the feedback for your update.')", true);

                txtProgressDicription.Text = "";
            }
            catch
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something went wrong! Please check the connection.')", true);
            }
        }

        protected void btnHistory_Click(object sender, EventArgs e)
        {
            Server.Transfer("Student_Panel_History.aspx");
        }

        protected void btnViewInfo_Click(object sender, EventArgs e)
        {
            Server.Transfer("Student_Panel_Information.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("Enr");
            Server.Transfer("Student_Login.aspx");
            Response.Cookies["enrollment"].Expires = DateTime.Now.AddDays(-1);
        }
    }
}