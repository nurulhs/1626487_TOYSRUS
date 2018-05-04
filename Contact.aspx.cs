using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace J39758_CO5027_ASG1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSendEmail_Click1(object sender, EventArgs e)
        {
            // Sends email using a mail server that requires login credentials and a secure connection, e.g. gmail

            //create mail client and message with to and from address, and set message subject and body
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            MailMessage msg = new MailMessage("nurulhs191@gmail.com", "nurulhs191@gmail.com");
            MailMessage msgToClient = new MailMessage();


            //settings sepcific to the mail service, e.g. server location, port number and that ssl is required
            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;

            //create credentials - e.g. username and password for the account
            smtpClient.UseDefaultCredentials = false;
            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("nurulhs191@gmail.com", "123456789nurul");

            smtpClient.Credentials = credentials;

            msg.Subject = "Dear " + textName.Text + ", Thank You for the feedback! We Hope to Hear from You Soon";
            msg.Body = "Dear " + textName.Text + "( " + textEmail.Text + " )"
                + System.Environment.NewLine + ". This is to notified that message has been received:"
                + System.Environment.NewLine + " Message Subject:" + System.Environment.NewLine + textSubject.Text
                + System.Environment.NewLine + " Message details: " + System.Environment.NewLine + textMessage.Text;

            msgToClient.From = new MailAddress(textEmail.Text);
            msgToClient.To.Add(new MailAddress(textEmail.Text));

            msgToClient.Subject = textSubject.Text;
            msgToClient.IsBodyHtml = true;
            msgToClient.Subject = textSubject.Text;
            msgToClient.Body = "From " + textName.Text + "( " + textEmail.Text + " )"
                + System.Environment.NewLine + " Message Subject:" + System.Environment.NewLine + textSubject.Text
                + System.Environment.NewLine + " Message details: " + System.Environment.NewLine + textMessage.Text;


            try
            {
                smtpClient.Send(msg);
                smtpClient.Send(msgToClient);
                litResult.Text =
                    "<p>Successful, Email sent using SMTP with secure connection and credentials</p>";
                textName.Text = string.Empty;
                textEmail.Text = string.Empty;
                textSubject.Text = string.Empty;
                textMessage.Text = string.Empty;
            }
            catch (Exception ex)
            {
                //display the full error to the user
                litResult.Text =
                    "<p>Send failed, please try again: " + ex.Message + ":" + ex.InnerException + "</p>";
            }
        }
    }
}