using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace J39758_CO5027_ASG1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var identityDbContext = new IdentityDbContext("IdentityConnectionString");
            var roleStore = new RoleStore<IdentityRole>(identityDbContext);
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var manager = new UserManager<IdentityUser>(userStore);

            IdentityRole adminRole = new IdentityRole("Admin");
            roleManager.Create(adminRole);
            var user = new IdentityUser()
            {
                UserName = text_RegUsername12.Text,
                Email = text_RegUsername12.Text
            };

            IdentityResult result = manager.Create(user, text_RegistPassword.Text);
            if (result.Succeeded)
            {
                manager.AddToRole(user.Id, "Admin");
                manager.Update(user);
                LiteralErrorMsg.Text = "Registration Successful";
            }
            else
            {
                LiteralErrorMsg.Text = "An error has occured: " + result.Errors.FirstOrDefault();
            }
        }
    }
}