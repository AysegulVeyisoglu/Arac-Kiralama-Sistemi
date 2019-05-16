using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AracKiralamaSistemi1.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(string kullaniciAdi, string sifre) 
        {
            SqlConnection con = new SqlConnection("data source=USER-HP; initial catalog=AracKiralamaSistemi;integrated security=True; MultipleActiveResultSets=True;");
             SqlCommand cmd = new SqlCommand("KullaniciKontroll",con);
            cmd.Parameters.Add("@kullaniciAdi", SqlDbType.NVarChar, 50).Value = kullaniciAdi;
            cmd.Parameters.Add("@sifre", SqlDbType.NVarChar, 50).Value = sifre;          
            cmd.CommandType = CommandType.StoredProcedure;       
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('Kullanıcı adı veya şifre yanlış!');</script>"); 
            }
            con.Close();
            return View();
        }
	}
}