using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FunActivityApp.Startup))]

namespace FunActivityApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}