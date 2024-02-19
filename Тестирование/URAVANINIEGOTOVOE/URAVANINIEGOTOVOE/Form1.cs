using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace URAVANINIEGOTOVOE
{
    public partial class Ura : Form
    {
        public static int CountA = 0;
        public static int CountB = 0;
        public static int CountC = 0;
        public static int PosA = 0;
        public static int PosB = 0;
        public static int PosC = 0;
        
        public Ura()
        {
            InitializeComponent();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (txtA.Text != "")
            {
                string substr = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator[0].ToString();
                int count = (txtA.Text.Length - txtA.Text.Replace(substr, "").Length) / substr.Length;
                if (count == 0) txtA.Text = txtA.Text + ",";
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (txtB.Text != "")
            {
                string substr = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator[0].ToString();
                int count = (txtB.Text.Length - txtB.Text.Replace(substr, "").Length) / substr.Length;
                if (count == 0) txtB.Text = txtB.Text + ",";
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            if (txtC.Text != "")
            {
                string substr = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator[0].ToString();
                int count = (txtC.Text.Length - txtC.Text.Replace(substr, "").Length) / substr.Length;
                if (count == 0) txtC.Text = txtC.Text + ",";
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            txtA.Clear();
            CountA = 0;
            PosA = 0;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            txtB.Clear();
            CountB = 0;
            PosB = 0;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            txtC.Clear();
            CountC = 0;
            PosC = 0;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            StringBuilder error = new StringBuilder();

            if (txtA.Text == "-") error.AppendLine("Введите еще число в коэффициент а!");
            if (txtB.Text == "-") error.AppendLine("Введите еще число в коэффициент b!");
            if (txtC.Text == "-") error.AppendLine("Введите еще число в коэффициент c!");
            if (string.IsNullOrWhiteSpace(txtA.Text)) error.AppendLine("Введите коэфициент А");
            if (string.IsNullOrWhiteSpace(txtB.Text)) error.AppendLine("Введите коэфициент B");
            if (string.IsNullOrWhiteSpace(txtC.Text)) error.AppendLine("Введите коэфициент C");
            
            if (error.Length > 0)
            {
                MessageBox.Show(error.ToString());
                return;
            }

            double a = Convert.ToDouble(txtA.Text);
            double b = Convert.ToDouble(txtB.Text);
            double c = Convert.ToDouble(txtC.Text);
            if (a > 50 || a < -50) error.AppendLine("Коэффициент а вне диапазона допустимых значений!");
            if (b > 50 || b < -50) error.AppendLine("Коэффициент b вне диапазона допустимых значений!");
            if (c > 50 || c < -50) error.AppendLine("Коэффициент c вне диапазона допустимых значений!");
          

            if (error.Length > 0)
            {
                MessageBox.Show(error.ToString());
                return;
            }
            else
            {
               

                if (a == 0) label1.Text = "Уравнение не квадратное, так как а = 0";
                else
                {
                    double D = Math.Pow(b, 2) - (4 * a * c);
                    if (D < 0) label1.Text = "Корней нет";
                    else if (D == 0)
                    {
                        double x = (-b) / (2 * a);
                        label1.Text = $"x = {x}";
                    }
                    else
                    {
                        double x1 = (-b + Math.Sqrt(D)) / (2 * a);
                        double x2 = (-b - Math.Sqrt(D)) / (2 * a);
                        label1.Text = $"x1 = {x1} x2 = {x2}";
                    }
                }
            }
        }

        private void txtB_KeyPress(object sender, KeyPressEventArgs e)
        {
         
            String txtb = txtB.ToString();

            if (PosB == 0 && CountB == 0 && e.KeyChar == '-')
            {
                CountB++;
                PosB++;
            }
            else if (PosB >= 0 && CountB >= 0)
            {
                e.Handled = !(Char.IsDigit(e.KeyChar));
                PosB++;
                CountB++;
            }

    }

        private void txtA_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (CountA == 0 && e.KeyChar == '-' && PosA == 0)
            {
                CountA ++;
                PosA++;
            }
            else if (PosA >= 0 && CountA >= 0)
            {
                e.Handled = !(Char.IsDigit(e.KeyChar));
                PosA++;
                CountA++;
               
            }

        }

        private void txtC_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (CountC == 0 && e.KeyChar == '-' && PosC == 0)
            {
                CountC++;
                PosC++;
            }
            else if (PosC >= 0 && CountC >=0)
            {
                e.Handled = !(Char.IsDigit(e.KeyChar));
                PosC++;
                CountC++;
            }

        }
    }
 }
