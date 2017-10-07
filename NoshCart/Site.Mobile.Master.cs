using NoshCart.CheckLogin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NoshCart
{
    public partial class Site_Mobile : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var AlternateView = "Desktop";
            var switchViewRouteName = "AspNet.FriendlyUrls.SwitchView";
            var url = GetRouteUrl(switchViewRouteName, new { view = AlternateView, __FriendlyUrls_SwitchViews = true });
            url += "?ReturnUrl=" + HttpUtility.UrlEncode(Request.RawUrl);
            Response.Redirect(url);
        }
    }
}