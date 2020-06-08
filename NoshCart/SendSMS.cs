using Newtonsoft.Json.Linq;
using System;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Xml.Linq;

namespace NoshCart.SendSMS
{
    public class Send
    {
        /// <summary>
        /// Send Any Kind Of Message
        /// </summary>
        public static string SendOrderConfirmationSMS() //invoked when to send the order confirmation message to the user
        {
            StringBuilder message = new StringBuilder(); //creating the string builder class to store the message

            //creating the required and appropriate message

            message.Append("Thank You " + HttpContext.Current.Session["Username"].ToString() + ", Your Order (Order Id:- "
                + HttpContext.Current.Session["OrderID"].ToString() + ") has been placed successfully and is being processed.Order Details are: -" + Environment.NewLine);

            message = AddProductNames(message); //calling the method to add the product names in the message

            message.Append(" Your Order will be delivered within 1 hour at "
                + HttpContext.Current.Session["Address"].ToString() + "." + Environment.NewLine + "Thank You For Shopping with us at NoshCart.com");
            
            return SendSMS(HttpContext.Current.Session["PhoneNumber"].ToString(), message.ToString()); //return the message and send the message to user phone number 
        }

        private static StringBuilder AddProductNames(StringBuilder message) //invoked when to add the purchased products in sms message
        {
            for (int i = 0; i < ((string[,])(HttpContext.Current.Session["MyCart"])).GetLength(0); i++)
            {
                if (((string[,])(HttpContext.Current.Session["MyCart"])).GetLength(0) == 1)
                {
                    message.Append((i + 1) + ". " + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 5] + " "
                    + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 1] + " Price:- "
                    + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 3] + Environment.NewLine);
                }
                else
                {
                    if (i == ((string[,])(HttpContext.Current.Session["MyCart"])).GetLength(0) - 1)
                    {
                        message.Append((i + 1) + ". " + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 5] + " "
                        + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 1] + " Price:- "
                        + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 3] + Environment.NewLine);
                    }
                    else
                    {
                        message.Append((i + 1) + ". " + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 5] + " "
                        + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 1] + " Price:- "
                        + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 3] + Environment.NewLine);
                    }
                }
            }

            message.Append("Total Products:- " + HttpContext.Current.Session["ttproduct"].ToString() + Environment.NewLine);
            message.Append("Total Price:- ₹" + HttpContext.Current.Session["ttprice"].ToString() + Environment.NewLine);

            if (HttpContext.Current.Session["PaymentMode"].ToString() == "1")
            {
                message.Append("Please keep the cash ready.");
            }

            if (HttpContext.Current.Session["PaymentMode"].ToString() == "2")
            {
                message.Append("Thank you for your payment via " + HttpContext.Current.Session["PaymentModeName"] + ". Your transaction has been successfully completed.");
            }

            message.Append(" Details for your order are also sent to you at " + HttpContext.Current.Session["Email"].ToString() + ".");

            return message;
        }

        /// <summary>
        /// Send Order Confirmation Message via E-Mail
        /// </summary>
        public static string SendOrderConfirmationMail() //invoked when to send the order confirmation via email
        {
            StringBuilder sbEmailBody = new StringBuilder(); //creating the stringbuilder variable to store email message

            //creating the message

            sbEmailBody.Append("Hi " + HttpContext.Current.Session["Username"].ToString() + ",<br/><br/>");
            sbEmailBody.Append("Thank you for your order!");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Your order is being processed and will be delivered to you with-in 1 hour. Meanwhile, you can check the status of" +
                " your order on NoshCart.com");

            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("Please find below, the summary of your order <b>" + HttpContext.Current.Session["OrderID"].ToString() + "</b>");
            sbEmailBody.Append("<br/>");

            sbEmailBody.Append("S.No.   Product Name    Quantity    Price   Total Price");
            sbEmailBody.Append("<br/>");

            //adding the product details
            for (int i = 0; i < ((string[,])(HttpContext.Current.Session["MyCart"])).GetLength(0); i++)
            {
                sbEmailBody.Append(i + 1 + ". " + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 1]
                    + "\t" + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 5] + "\t"
                    + ((string[,])(HttpContext.Current.Session["MyCart"]))[i, 3] + "\t"
                    + (Convert.ToInt32(((string[,])(HttpContext.Current.Session["MyCart"]))[i, 5])
                    * Convert.ToInt32(((string[,])(HttpContext.Current.Session["MyCart"]))[i, 3])).ToString() + ".");

                sbEmailBody.Append("<br/>");
            }

            sbEmailBody.Append("Total Products:- " + HttpContext.Current.Session["ttproduct"].ToString() + Environment.NewLine);
            sbEmailBody.Append("Total Price:- ₹" + HttpContext.Current.Session["ttprice"].ToString() + Environment.NewLine);
            
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("<b>Delivery Address:-</b>");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("<b>" + HttpContext.Current.Session["Username"].ToString() + " " + HttpContext.Current.Session["PhoneNumber"].ToString() + "</b>");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>" + HttpContext.Current.Session["Address"].ToString() + "</b>");
            sbEmailBody.Append("<br/><br/>");

            if (HttpContext.Current.Session["PaymentMode"].ToString() == "1")
            {
                sbEmailBody.Append("Please keep the cash ready.");
            }

            if (HttpContext.Current.Session["PaymentMode"].ToString() == "2")
            {
                sbEmailBody.Append("Thank you for your payment via " + HttpContext.Current.Session["PaymentModeName"] + ". Your transaction has been completed.");
            }

            sbEmailBody.Append(" Details for your order are also sent to you via sms.");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>Thanks For Shopping With Us.</b>");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>© " + DateTime.Now.Year + " - NoshCart.com</b>");

            string Subject = "Order Confirmation - Your Order with NoshCart.com [" + HttpContext.Current.Session["OrderID"].ToString() + "] has been successfully placed!";

            return send_Email(HttpContext.Current.Session["Email"].ToString(), Subject, sbEmailBody); //returning and sending the email
        }

        public static string SendSMS(string ToNumber, string ToMessage) //invoked when to send the sms message
        {
            ISmsMessageBuilder messageBuilder;
            //Guid productToken = new Guid("CD6398D1-BD65-4B40-BD96-7BCC015702B4");
            Guid productToken = new Guid("303c309b-1926-4505-bcb8-9887d2973149");
                                          
            //Use XML or JSON per your own preference
            messageBuilder = new JsonSmsMessageBuilder();
            var request = messageBuilder.CreateMessage(productToken, "NoshCart", "0091" + ToNumber, ToMessage);

            var response = doHttpPost(messageBuilder.GetTargetUrl(),
                                      messageBuilder.GetContentType(),
                                      request);
            return response;

            //Console.WriteLine($"Response: {response}");
            //Console.ReadKey();
        }

        

        /// <summary>
        /// Request OTP via E-Mail To Reset The Forgot Password
        /// </summary>

        public static string Mail(string ToEmail, string UserName, string UniqueId) //invoked when to send the OTP via email when forgot password
        {
            StringBuilder sbEmailBody = new StringBuilder(); //Creating StringBuilder variable to store the message

            //creating the message

            sbEmailBody.Append("Dear " + UserName + ",<br/><br/>");
            sbEmailBody.Append("Please click on the following link to reset your password");
            sbEmailBody.Append("<br/>");

            sbEmailBody.Append("http://noshcart-001-site1.btempurl.com/Account/ChangePassword.aspx?uid=" + UniqueId);

            //sbEmailBody.Append("http://localhost:7451/Account/ChangePassword.aspx?uid=" + UniqueId);

            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<b>© " + DateTime.Now.Year + " - NoshCart.com</b>");

            string Subject = "Reset Your Password - NoshCart.com";

            return send_Email(ToEmail, Subject, sbEmailBody); //returning and sending the email
        }

        /// <summary>
        /// Send Any Kind Of Email To Anyone
        /// </summary>

        public static string send_Email(string ToEmail, string Subject, StringBuilder Message) //invoked when to send email
        {
            try
            {
                MailMessage mailMessage = new MailMessage("infokazas@gmail.com", ToEmail); //creating the new mailmessage object with FROM and TO email as parameters

                mailMessage.IsBodyHtml = true; //setting the html body true

                mailMessage.Body = Message.ToString(); //saving the message as string as the body of email
                mailMessage.Subject = Subject; //setting the subject of the email
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587); //creating the smtp client and setting the server name and port number to send the email

                smtpClient.Credentials = new NetworkCredential() //saving the gmail Login ID and Password
                {
                    UserName = "infokazas@gmail.com",
                    Password = "Rajat@1996"
                };

                smtpClient.EnableSsl = true; //enabling the SSL while sending the email so that its secure and encrypted
                smtpClient.Send(mailMessage); //sending the email
            }

            catch (Exception e)
            {
                return e.Message;
            }

            return "Success";
        }

        /// <summary>
        /// Sends a string via HTTP POST to a url
        /// </summary>
        /// <param name="url">The target url to send the string to</param>
        /// <param name="requestString">The string to send</param>
        /// <returns>The response of the url or the error text in case of an error</returns>
        private static string doHttpPost(string url, string contentType, string requestString)
        {
            try
            {
                //Console.WriteLine($"Sending request to: {url}");
                var webClient = new WebClient();
                webClient.Headers["Content-Type"] = contentType;
                webClient.Encoding = Encoding.UTF8;
                return webClient.UploadString(url, requestString);
            }
            catch (WebException wex)
            {
                return string.Format("{0} - {1}", wex.Status, wex.Message);
            }
        }
    }

    /// <summary>
    /// The gateway accepts both the XML amd JSON formats
    /// </summary>
    public interface ISmsMessageBuilder
    {

        /// <summary>
        /// Creates a string according to the technical requirements
        /// of the CM MT gateway for sending a simple SMS text message
        /// </summary>
        /// <param name="productToken">Your product token</param>
        /// <param name="sender">A sendername/shortcode the SMS message</param>
        /// <param name="message">The text to be sent</param>
        /// <param name="recipient">The recipient's MSISDN</param>
        /// <returns>A string according to the technical requirements of the CM MT gateway,
        /// based on the provided parameters</returns>
        string CreateMessage(Guid productToken,
            string sender,
            string recipient,
            string message);

        /// <summary>
        /// The XML and JSON gateways use different URLs
        /// </summary>
        /// <returns>The target URL of either the XML or JSON gateway</returns>
        string GetTargetUrl();

        /// <summary>
        /// The JSON gateway requires you to set the content type to "application/json"
        /// </summary>
        /// <returns>The string of the content type to be used in the HTTP header </returns>
        string GetContentType();
    }

    public class XmlSmsMessageBuilder : ISmsMessageBuilder
    {
        public string CreateMessage(Guid productToken,
                                    string sender,
                                    string recipient,
                                    string message)
        {
            return
               new XElement("MESSAGES",
                   new XElement("AUTHENTICATION",
                       new XElement("PRODUCTTOKEN", productToken)
               ),
               new XElement("MSG",
                   new XElement("FROM", sender),
                   new XElement("TO", recipient),
                   new XElement("BODY", message)
               )
            ).ToString();
        }

        public string GetContentType()
        { return "application/xml"; }

        public string GetTargetUrl()
        { return "https://sgw01.cm.nl/gateway.ashx"; }
    }

    /// <summary>
    /// For JSON string building we recommend the Newtonsoft JSON NuGet package
    /// Feel free to substitute with your own preference in .net JSON library
    /// </summary>
    public class JsonSmsMessageBuilder : ISmsMessageBuilder
    {
        public string CreateMessage(Guid productToken,
                            string sender,
                            string recipient,
                            string message)
        {
            return new JObject
            {
                ["Messages"] = new JObject
                {
                    ["Authentication"] = new JObject
                    {
                        ["ProductToken"] = productToken
                    },
                    ["Msg"] = new JArray {
                        new JObject {
                            ["From"] = sender,
                            ["To"] = new JArray {
                                new JObject { ["Number"] = recipient }
                            },
                            ["maximumNumberOfMessageParts"] = 8,
                            ["type"] = "AUTO",
                            ["Body"] = new JObject {
                                ["Content"] = message
                            }
                        }
                    }
                }
            }.ToString();
        }

        public string GetContentType()
        { return "application/json"; }

        public string GetTargetUrl()
        { return "https://gw.cmtelecom.com/v1.0/message"; }
    }
}