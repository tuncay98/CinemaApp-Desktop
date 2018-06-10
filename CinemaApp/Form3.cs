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
using ClosedXML.Excel;

namespace CinemaApp
{
    public partial class Form3 : Form
    {

        private CinemaAppEntities1 db = new CinemaAppEntities1();

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
                decimal price = Convert.ToDecimal(textBox1.Text);
                if (ordering.Count > 0)
                {
                    var list = ordering.Where(w => w.Price == price).ToList();
                    ordering.Clear();
                    ordering.AddRange(list);

                }
                else if (ordering.Count == 0)
                {
                    
                    var list = db.Orders.Where(w => w.Price == price).ToList();
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

        private void btnExport_Click(object sender, EventArgs e)
        {
            
            SaveFileDialog sfd = new SaveFileDialog();
            sfd.InitialDirectory = @"C:\";
            sfd.FileName = "";
            sfd.Title = "Save as EXcel file";
            sfd.DefaultExt = "xlsx";
            sfd.Filter = "Excel (*.xlsx) | *.xlsx";

            if(sfd.ShowDialog() == DialogResult.OK)
            {
                var wb = new XLWorkbook();
                var ws = wb.AddWorksheet("Orders");

                ws.Row(1).Height = 20;


                Dictionary<string, string> list = new Dictionary<string, string>() {
                {"A","Film Name" },
                {"B", "Hall"},
                {"C", "Date" },
                {"D", "Time" },
                {"E", "Buyed" },
                {"F", "Price" },
                {"G", "Row" },
                {"H", "Seat" }
            };
                foreach (KeyValuePair<string, string> item in list)
                {
                    ws.Cell(item.Key + "1").Value = item.Value;
                    ws.Column(item.Key).Style.Alignment.SetHorizontal(XLAlignmentHorizontalValues.Center);
                    ws.Column(item.Key).Style.Alignment.SetVertical(XLAlignmentVerticalValues.Center);
                    ws.Cell(item.Key + "1").Style.Font.SetBold();
                    ws.Cell(item.Key + "1").Style.Font.SetFontSize(20);
                    ws.Column(item.Key).AdjustToContents();
                }
                int begin = 0;
                int excell = 2;

                for (int i = 0; i < dataGridView1.Rows.Count; i++)
                {
                    ws.Cell("A" + excell).Value = dataGridView1.Rows[begin].Cells[0].Value;
                    ws.Cell("B" + excell).Value = dataGridView1.Rows[begin].Cells[1].Value;
                    ws.Cell("C" + excell).Value = dataGridView1.Rows[begin].Cells[2].Value;
                    ws.Cell("D" + excell).Value = dataGridView1.Rows[begin].Cells[3].Value;
                    ws.Cell("E" + excell).Value = dataGridView1.Rows[begin].Cells[4].Value;
                    ws.Cell("F" + excell).Value = dataGridView1.Rows[begin].Cells[5].Value;
                    ws.Cell("G" + excell).Value = dataGridView1.Rows[begin].Cells[6].Value;
                    ws.Cell("H" + excell).Value = dataGridView1.Rows[begin].Cells[7].Value;
                    excell++;
                }

                wb.SaveAs(sfd.FileName.ToString());
                wb.Save(true);
                
            }

        }
    }
}
