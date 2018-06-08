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
    public partial class Form2 : Form
    {

        private List<Button> buttonlar = new List<Button>();

        Form1 form1 = new Form1();
        private CinemaAppEntities dp = new CinemaAppEntities();

        public Form2()
        {
            InitializeComponent();
            Create();

            

        }
        private Dictionary<Button, Seat> btns = new Dictionary<Button, Seat>();
        private void Create() 
        {
            List<Seat> seats = dp.Seats.Where(w=> w.HallId== Form1.HallIdTaker).ToList();

            int Top = 0;
            foreach (var item in seats)
            {

                        for (int i = 0; i < item.Columns.Value; i++)
                        {
                            Button btn = new Button();
                            btn.Width = 30;
                            btn.Height = 20;
                            btn.Left = 35 * (i + 1);
                             btn.Text = (i+1).ToString();
                            btn.Top = Top;
                             btn.Click += new EventHandler(but);
                            Controls.Add(btn);
                            btns.Add(btn, item);
                    
                        }

                Top += 20;
                    

               
            }
            MakeRed();



        }

        private void MakeRed()
        {
            List<Order> orders = dp.Orders.Where(w => w.PosterId == Form1.IdTaker).ToList();
            foreach (var item in orders)
            {
                foreach (KeyValuePair<Button, Seat> elem in btns)
                {
                    if (elem.Value.Id == item.SeatId && Convert.ToInt32(elem.Key.Text) == item.Column && item.Date == Form1.zaman)
                    {


                        elem.Key.BackColor = Color.Red;
                        elem.Key.ForeColor = Color.Black;
                        elem.Key.FlatStyle = FlatStyle.Flat;

                    }
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (buttonlar.Count == 0)
            {
                MessageBox.Show("Xahish edirik yer seciniz!");
            }
            else
            {
                DialogResult YoN = MessageBox.Show("Almaq Istediyiinzden Eminsizin mi?", "Bilet Alma Emeliyyati", MessageBoxButtons.YesNo);
                if (YoN == DialogResult.Yes)
                {
                    foreach (var item in buttonlar)
                    {
                        Order NewIteam = new Order();
                        NewIteam.PosterId = Form1.IdTaker;
                        NewIteam.Date = Form1.zaman;
                        NewIteam.ActionDate = DateTime.Now;
                        NewIteam.Price = Convert.ToDecimal(Form1.PosterPrice.Split(' ')[0]);
                        foreach (KeyValuePair<Button, Seat> ad in btns)
                        {
                            if (item == ad.Key)
                            {
                                NewIteam.SeatId = ad.Value.Id;
                                NewIteam.Column = Convert.ToInt32(ad.Key.Text);
                            }
                        }
                        dp.Orders.Add(NewIteam);
                        dp.SaveChanges();
                    }

                    MakeRed();
                    buttonlar.Clear();
                }
            }
            

        }


        private void but(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (btn.BackColor != Color.Red && !buttonlar.Contains(btn))
            {
                buttonlar.Add(btn);
                foreach (var item in buttonlar)
                {

                    item.BackColor = Color.Blue;
                    item.ForeColor = Color.White;

                }
            }
            else if(btn.BackColor== Color.Blue && buttonlar.Contains(btn))
            {
                buttonlar.Remove(btn);
                btn.BackColor = Color.Transparent;
                btn.ForeColor = Color.Black;
            }



        }


    }
}
