using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication2
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource2.DataBind();
            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            string totalemp = dv[0]["Total_Employees"].ToString();

            // Set the Text property of the label to the value of totalemp
            Label1.Text = totalemp;
        }
    }
}