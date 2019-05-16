using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AracKiralamaSistemi1.Controllers
{
    public class AracController : Controller
    {
        //
        // GET: /Arac/
        public ActionResult Index()
        {
            return View();
        }

        public void AracKayit(string marka,string model,int modelYili, string plaka,string sasiNo,string renk,string tip,int gunlukUcret)
        {

            SqlConnection con = new SqlConnection("data source=USER-HP; initial catalog=AracKiralamaSistemi;integrated security=True; MultipleActiveResultSets=True;");

            SqlCommand cmd = con.CreateCommand();
            // cmd.CommandType = CommandType.StoredProcedure;

            cmd.CommandText = "Execute AracEkle @marka,@model,@modelyili,@plaka,@sasino,@renk,@tip,@gunlukucret";
            cmd.Parameters.Add("@marka", SqlDbType.NVarChar, 50).Value = marka;
            cmd.Parameters.Add("@model", SqlDbType.NVarChar, 50).Value = model;
            cmd.Parameters.Add("@modelyili", SqlDbType.Int).Value = modelYili;
            cmd.Parameters.Add("@plaka", SqlDbType.NVarChar, 50).Value = plaka;
            cmd.Parameters.Add("@sasino", SqlDbType.NVarChar, 50).Value = sasiNo;
            cmd.Parameters.Add("@renk", SqlDbType.NVarChar, 50).Value = renk;
            cmd.Parameters.Add("@tip", SqlDbType.NVarChar, 50).Value = tip;
            cmd.Parameters.Add("@gunlukucret", SqlDbType.Money).Value = gunlukUcret;
            

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
	}
}