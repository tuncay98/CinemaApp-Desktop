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
    public partial class Form3 : Form
    {

        private CinemaAppEntities db = new CinemaAppEntities();

        public Form3()
        {
            InitializeComponent();
            Fill();
            FillCmb1();
            Fillcmb2();
        }

        private void Fill()
        {
            List<Order> pos = db.Orders.OrderBy(o=> o.Date).ToList();

            foreach (var item in pos)
            {
                dataGridView1.Rows.Add(item.Poster.Film.Name, item.Poster.Hall.Name, item.Date.Value.ToString("yyyy-MM-dd"), item.Poster.Time, item.ActionDate, item.Price, item.Seat.Row, item.Column);
            }
        }

        private void FillCmb1()
        {
            List<Film> names = db.Films.ToList();
            foreach (var item in names)
            {
                cmbFilm.Items.Add(item.Id +"-"+item.Name);
            }
        }

        private void Fillcmb2()
        {
            List<Hall> names = db.Halls.ToList();
            foreach (var item in names)
            {
                cmbHall.Items.Add(item.Name);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            List<Order> ordering = new List<Order>();
            ordering.Clear();
          
            

            if (cmbFilm.Text!= string.Empty)
            {
                int cmbid = Convert.ToInt32(cmbFilm.Text.Split('-')[0]);
                var list = db.Orders.Where(w => w.Poster.Film.Id == cmbid ).ToList();
                ordering.AddRange(list);
            }

            if (cmbHall.Text != string.Empty)
            {
                if (ordering.Count > 0)
                {
                    var list = ordering.Where(w => w.Poster.Hall.Name == cmbHall.Text).ToList();
                    ordering.Clear();
                    ordering.AddRange(list);

                }
                else if (ordering.Count == 0)
                {
                    var list = db.Orders.Where(w => w.Poster.Hall.Name == cmbHall.Text).ToList();
                    ordering.AddRange(list);
                }
            }
     
            
            if (dtp.Value.ToString("HH:mm") != DateTime.Now.ToString("HH:mm"))
            {
                if (ordering.Count > 0)
                {
                    var list = ordering.Where(w => w.Poster.Time.Value == dtp.Value.TimeOfDay).ToList();
                    ordering.Clear();
                    ordering.AddRange(list);

                }
                else if (ordering.Count == 0)
                {
                    var list = db.Orders.Where(w => w.Poster.Time.Value== dtp.Value.TimeOfDay).ToList();
                    ordering.AddRange(list);
                }
            }

            if (dateTimePicker1.Value.ToString("yyyy-MM-dd") != DateTime.Now.ToString("yyyy-MM-dd"))
            {
            
                if (ordering.Count > 0)
                {
                    var list = ordering.Where(w => w.Date == dateTimePicker1.Value.Date).ToList();
                    ordering.Clear();
                    ordering.AddRange(list);

                }
                else if (ordering.Count == 0)
                {
                    var list = db.Orders.Where(w => w.Date == dateTimePicker1.Value.Date).ToList();
                    ordering.AddRange(list);
                }
            }
            if(textBox1.Text != string.Empty)
            {
                if (ordering.Count > 0)
                {
                    var list = ordering.Where(w => w.Price == Convert.ToDecimal(textBox1.Text)).ToList();
                    ordering.Clear();
                    ordering.AddRange(list);

                }
                else if (ordering.Count == 0)
                {
                    var list = db.Orders.Where(w => w.Price == Convert.ToDecimal(textBox1.Text)).ToList();
                    ordering.AddRange(list);
                }
            }

            dataGridView1.Rows.Clear();
            foreach (var item in ordering)
            {

                dataGridView1.Rows.Add(item.Poster.Film.Name, item.Poster.Hall.Name, item.Date.Value.ToString("yyyy-MM-dd"), item.Poster.Time, item.ActionDate, item.Price, item.Seat.Row, item.Column);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.Rows.Clear();
            cmbFilm.Text = "";
            cmbHall.Text = "";
            dtp.Value = DateTime.Now;
            dateTimePicker1.Value = DateTime.Now;
            textBox1.Text = "";
            Fill();
        }
    }
}
