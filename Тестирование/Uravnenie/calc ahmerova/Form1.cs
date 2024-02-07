using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace calc_ahmerova
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }



        private void button15_Click(object sender, EventArgs e)
        {
            if (txtA.Text != "")
            {
                string substr = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator[0].ToString();
                int count = (txtA.Text.Length - txtA.Text.Replace(substr, "").Length) / substr.Length;
                if (count == 0) txtA.Text = txtA.Text + ",";
            }




        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !(Char.IsDigit(e.KeyChar));
        }

        private void textBox2_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !(Char.IsDigit(e.KeyChar));
        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !(Char.IsDigit(e.KeyChar));
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            StringBuilder error = new StringBuilder();
            if (string.IsNullOrWhiteSpace(txtA.Text)) error.AppendLine("Введите коэфициент А");
            if (string.IsNullOrWhiteSpace(txtB.Text)) error.AppendLine("Введите коэфициент B");
            if (string.IsNullOrWhiteSpace(txtC.Text)) error.AppendLine("Введите коэфициент C");

            if (error.Length > 0)
            {
                MessageBox.Show(error.ToString());
                return;
            }
            else
            {
                double a = Convert.ToDouble(txtA.Text);
                double b = Convert.ToDouble(txtB.Text);
                double c = Convert.ToDouble(txtC.Text);
                if ((a >= -50 && a <= 50) && (b >= -50 && b <= 50) && (c >= -50 && c <= 50))
                {
                    if (a == 0) label1.Text = "Уравнение не квадратное, тк а=0";
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
                else label1.Text = "Введено значение вне допустимого диапазона значений";
            }
            
        }


        private void button5_Click(object sender, EventArgs e)
        {
            txtA.Clear();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            txtB.Clear();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            txtC.Clear();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (txtB.Text != "")
            {
                string substr = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator[0].ToString();
                int count = (txtB.Text.Length - txtB.Text.Replace(substr, "").Length) / substr.Length;
                if (count == 0) txtB.Text = txtB.Text + ",";
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (txtC.Text != "")
            {
                string substr = System.Globalization.CultureInfo.CurrentCulture.NumberFormat.NumberDecimalSeparator[0].ToString();
                int count = (txtC.Text.Length - txtC.Text.Replace(substr, "").Length) / substr.Length;
                if (count == 0) txtC.Text = txtC.Text + ",";
            }
        }


    }
}
