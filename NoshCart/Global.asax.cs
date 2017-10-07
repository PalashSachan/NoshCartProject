using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using NoshCart.CheckLogin;
using System.Data;

namespace NoshCart
{
    public class Global : HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            if (HttpContext.Current.User != null && HttpContext.Current.User.Identity.IsAuthenticated)
            {
                HttpContext.Current.Session.Add("IsAuthenticated", true);
                HttpContext.Current.Session.Add("Username", HttpContext.Current.User.Identity.Name);
                Check.GetAuthenticatedUserAllInfo();
            }
            else
            {
                HttpContext.Current.Session.Clear();
                HttpContext.Current.Session.Add("IsAuthenticated", false);
            }
            Session["LastError"] = ""; //initialize the session
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            Session.Add("LastError", ex);
            Server.ClearError();
            Response.Redirect("~/Error/Error");
        }
    }
}