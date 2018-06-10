using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CinemaApp.Models;

namespace CinemaApp
{
    public partial class Form1 : Form
    {
        private CinemaAppEntities1 dp = new CinemaAppEntities1();

        public static int HallIdTaker;

        public static int IdTaker;

        public static DateTime zaman;

        public static string PosterPrice;



        public Form1()
        {
            
            InitializeComponent();
            dtp.MinDate = DateTime.Now;
        }


        private void dtp_ValueChanged(object sender, EventArgs e)
        {
            dgv.Rows.Clear();
            List<Poster> pos = dp.Posters.ToList();
            foreach (var item in pos)
            {
                if (item.PrimaryDate < dtp.Value && item.EndDate > dtp.Value)
                {
                    dgv.Rows.Add(item.Film.Name, item.Hall.Name, item.Time, item.Price.Value.ToString("#.##" + " Azn"), item.Id, item.HallId);
                }
            }
        }

        public void dgv_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            zaman = dtp.Value.Date;
            PosterPrice = dgv.Rows[e.RowIndex].Cells[3].Value.ToString();

            

            HallIdTaker = Convert.ToInt32(dgv.Rows[e.RowIndex].Cells[5].Value);
            IdTaker= Convert.ToInt32(dgv.Rows[e.RowIndex].Cells[4].Value);

            Form2 secondApp = new Form2();
            secondApp.Show();
            
           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form3 f3 = new Form3();
            f3.Show();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
