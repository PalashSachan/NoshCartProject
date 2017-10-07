using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NoshCart.Error
{
    public partial class Error : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            Exception err = Session["LastError"] as Exception;
            StringBuilder sb = new StringBuilder();

            //Exception err = Server.GetLastError();

            if (err != null)
            {
                sb = geterror(err.GetBaseException());
                Session["LastError"] = null;

                NoshCart.SendSMS.Send.send_Email("Palashsachantesting@gmail.com", "[URGENT ATTENTION - ERROR OCCURRED]", sb);
            }
        }

        StringBuilder geterror(Exception objError)
        {
            StringBuilder lasterror = new StringBuilder();

            if (objError != null)
            {
                if (objError.Message != null)
                {
                    lasterror.AppendLine("Message:");
                    lasterror.AppendLine(objError.Message);
                    lasterror.AppendLine();
                }

                if (objError.InnerException != null)
                {
                    lasterror.AppendLine("InnerException:");
                    lasterror.AppendLine(objError.InnerException.GetType().ToString());
                    lasterror.AppendLine();
                }

                if (objError.Source != null)
                {
                    lasterror.AppendLine("Source:");
                    lasterror.AppendLine(objError.Source);
                    lasterror.AppendLine();
                }

                if (objError.StackTrace != null)
                {
                    lasterror.AppendLine("StackTrace:");
                    lasterror.AppendLine(objError.StackTrace);
                    lasterror.AppendLine();
                }
            }
            return lasterror;
        }
    }
}