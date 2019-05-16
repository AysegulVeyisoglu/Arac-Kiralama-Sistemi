using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AracKiralamaSistemi1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public void Save(string musteriAdi, int TCKN, string unvan, string cinsiyet, DateTime dogumTarihi, int vergiNo, string vergiDairesi, string adres,int telefon)
        {
            
            SqlConnection con = new SqlConnection("data source=USER-HP; initial catalog=AracKiralamaSistemi;integrated security=True; MultipleActiveResultSets=True;");
            
            SqlCommand cmd = con.CreateCommand();
           // cmd.CommandType = CommandType.StoredProcedure;
           
                cmd.CommandText = "Execute MusteriEkle @name,@tc,@unvan,@cinsiyet,@dogumtarihi,@vergino,@vergidairesi,@adres,@telefon";
                cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50).Value = musteriAdi;
                cmd.Parameters.Add("@tc", SqlDbType.Int).Value = TCKN;
                cmd.Parameters.Add("@unvan", SqlDbType.NVarChar, 50).Value = unvan;
                cmd.Parameters.Add("@cinsiyet", SqlDbType.NVarChar, 50).Value = cinsiyet;
                cmd.Parameters.Add("@vergidairesi", SqlDbType.NVarChar, 50).Value = vergiDairesi;
                cmd.Parameters.Add("@adres", SqlDbType.NVarChar, 50).Value = adres;
                cmd.Parameters.Add("@dogumtarihi", SqlDbType.DateTime).Value = dogumTarihi;
                cmd.Parameters.Add("@vergino", SqlDbType.Int).Value = vergiNo;
                cmd.Parameters.Add("@telefon", SqlDbType.Int).Value = telefon;

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            
        }
  
    }
}